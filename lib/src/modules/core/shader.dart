part of '../../raylib.dart';

mixin _CoreShaderModule on _RayLibBase {
  Shader loadShader(
    String? vsFileName,
    String? fsFileName,
  ) {
    return using(
      (arena) => Shader.fromRef(
        _native.LoadShader(
          vsFileName?.toNativeUtf8(allocator: arena).cast() ?? nullptr,
          fsFileName?.toNativeUtf8(allocator: arena).cast() ?? nullptr,
        ),
      ),
    );
  }

  Shader loadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) {
    return using(
      (arena) => Shader.fromRef(
        _native.LoadShader(
          vsCode?.toNativeUtf8(allocator: arena).cast() ?? nullptr,
          fsCode?.toNativeUtf8(allocator: arena).cast() ?? nullptr,
        ),
      ),
    );
  }

  bool isShaderReady(Shader shader) => _native.IsShaderReady(shader.ref);

  int getShaderLocation(
    Shader shader,
    String uniformName,
  ) {
    return using(
      (arena) => _native.GetShaderLocation(
        shader.ref,
        uniformName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  int getShaderLocationAttrib(
    Shader shader,
    String attribName,
  ) {
    return using(
      (arena) => _native.GetShaderLocationAttrib(
        shader.ref,
        attribName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setShaderValue(
    Shader shader,
    int locIndex,
    UniformValue value,
  ) =>
      _native.SetShaderValue(
        shader.ref,
        locIndex,
        value.toUniformPointer().cast(),
        value.dataType.index,
      );

  void setShaderValueV(
    Shader shader,
    int locIndex,
    List<UniformValue> value,
  ) {
    assert(value.isNotEmpty);
    final checkedType = value.first.dataType;
    assert(value.every((e) => e.dataType == checkedType));

    final pointer = switch (checkedType) {
      ShaderUniformDataType.float ||
      ShaderUniformDataType.vec2 ||
      ShaderUniformDataType.vec3 ||
      ShaderUniformDataType.vec4 =>
        calloc<Float>(checkedType.size * value.length),
      ShaderUniformDataType.integer ||
      ShaderUniformDataType.ivec2 ||
      ShaderUniformDataType.ivec3 ||
      ShaderUniformDataType.ivec4 =>
        calloc<Int32>(checkedType.size * value.length),
      _ => throw UnimplementedError(),
    };

    int index = 0;
    for (final val in value) {
      index = val.serialize(pointer, index);
    }

    return _native.SetShaderValueV(
      shader.ref,
      locIndex,
      pointer.cast(),
      checkedType.index,
      value.length,
    );
  }

  void setShaderValueMatrix(
    Shader shader,
    int locIndex,
    Matrix mat,
  ) =>
      _native.SetShaderValueMatrix(shader.ref, locIndex, mat.ref);

  void setShaderValueTexture(
    Shader shader,
    int locIndex,
    Texture2D texture,
  ) =>
      _native.SetShaderValueTexture(shader.ref, locIndex, texture.ref);

  void unloadShader(Shader shader) => _native.UnloadShader(shader.ref);
}
