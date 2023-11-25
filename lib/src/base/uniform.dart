import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/enums/shader.dart';

sealed class UniformValue<T, N extends NativeType> {
  final T value;

  const UniformValue(this.value);

  static UniformValue<int, Int32> integer(int value) => _UniformInt(value);

  static UniformValue<double, Float> float(double value) =>
      _UniformFloat(value);

  static UniformValue<Vector2, Float> vec2(Vector2 value) =>
      _UniformVec2(value);

  static UniformValue<Vector3, Float> vec3(Vector3 value) =>
      _UniformVec3(value);

  static UniformValue<Vector4, Float> vec4(Vector4 value) =>
      _UniformVec4(value);

  static UniformValue<IVector2, Int32> ivec2(IVector2 value) =>
      _UniformIVec2(value);

  static UniformValue<IVector3, Int32> ivec3(IVector3 value) =>
      _UniformIVec3(value);

  static UniformValue<IVector4, Int32> ivec4(IVector4 value) =>
      _UniformIVec4(value);

  ShaderUniformDataType get dataType;
  Pointer<N> toUniformPointer();
  int serialize(Pointer<N> array, int index);
}

class _UniformInt extends UniformValue<int, Int32> {
  const _UniformInt(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.integer;

  @override
  Pointer<Int32> toUniformPointer() {
    final pointer = calloc<Int32>();
    pointer.value = value;
    return pointer;
  }

  @override
  int serialize(Pointer<Int32> array, int index) {
    array[index] = value;
    return index + 1;
  }
}

class _UniformFloat extends UniformValue<double, Float> {
  const _UniformFloat(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.float;

  @override
  Pointer<Float> toUniformPointer() {
    final pointer = calloc<Float>();
    pointer.value = value;
    return pointer;
  }

  @override
  int serialize(Pointer<Float> array, int index) {
    array[index] = value;
    return index + 1;
  }
}

class _UniformVec2 extends UniformValue<Vector2, Float> {
  const _UniformVec2(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.vec2;

  @override
  Pointer<Float> toUniformPointer() {
    final pointer = calloc<Float>(2);
    pointer[0] = value.x;
    pointer[1] = value.y;
    return pointer;
  }

  @override
  int serialize(Pointer<Float> array, int index) {
    array[index] = value.x;
    array[index + 1] = value.y;
    return index + 2;
  }
}

class _UniformVec3 extends UniformValue<Vector3, Float> {
  const _UniformVec3(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.vec3;

  @override
  Pointer<Float> toUniformPointer() {
    final pointer = calloc<Float>(3);
    pointer[0] = value.x;
    pointer[1] = value.y;
    pointer[2] = value.z;
    return pointer;
  }

  @override
  int serialize(Pointer<Float> array, int index) {
    array[index] = value.x;
    array[index + 1] = value.y;
    array[index + 2] = value.z;
    return index + 3;
  }
}

class _UniformVec4 extends UniformValue<Vector4, Float> {
  const _UniformVec4(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.vec4;

  @override
  Pointer<Float> toUniformPointer() {
    final pointer = calloc<Float>(4);
    pointer[0] = value.x;
    pointer[1] = value.y;
    pointer[2] = value.z;
    pointer[3] = value.w;
    return pointer;
  }

  @override
  int serialize(Pointer<Float> array, int index) {
    array[index] = value.x;
    array[index + 1] = value.y;
    array[index + 2] = value.z;
    array[index + 3] = value.w;
    return index + 4;
  }
}

class _UniformIVec2 extends UniformValue<IVector2, Int32> {
  const _UniformIVec2(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.ivec2;

  @override
  Pointer<Int32> toUniformPointer() {
    final pointer = calloc<Int32>(2);
    pointer[0] = value.x;
    pointer[1] = value.y;
    return pointer;
  }

  @override
  int serialize(Pointer<Int32> array, int index) {
    array[index] = value.x;
    array[index + 1] = value.y;
    return index + 2;
  }
}

class _UniformIVec3 extends UniformValue<IVector3, Int32> {
  const _UniformIVec3(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.ivec3;

  @override
  Pointer<Int32> toUniformPointer() {
    final pointer = calloc<Int32>(3);
    pointer[0] = value.x;
    pointer[1] = value.y;
    pointer[2] = value.z;
    return pointer;
  }

  @override
  int serialize(Pointer<Int32> array, int index) {
    array[index] = value.x;
    array[index + 1] = value.y;
    array[index + 2] = value.z;
    return index + 3;
  }
}

class _UniformIVec4 extends UniformValue<IVector4, Int32> {
  const _UniformIVec4(super.value);

  @override
  ShaderUniformDataType get dataType => ShaderUniformDataType.ivec4;

  @override
  Pointer<Int32> toUniformPointer() {
    final pointer = calloc<Int32>(4);
    pointer[0] = value.x;
    pointer[1] = value.y;
    pointer[2] = value.z;
    pointer[3] = value.w;
    return pointer;
  }

  @override
  int serialize(Pointer<Int32> array, int index) {
    array[index] = value.x;
    array[index + 1] = value.y;
    array[index + 2] = value.z;
    array[index + 3] = value.w;
    return index + 4;
  }
}

extension UniformIntConverter on int {
  UniformValue<int, Int32> get asUniform => UniformValue.integer(this);
}

extension UniformFloatConverter on double {
  UniformValue<double, Float> get asUniform => UniformValue.float(this);
}

extension UniformVec2Converter on Vector2 {
  UniformValue<Vector2, Float> get asUniform => UniformValue.vec2(this);
}

extension UniformVec3Converter on Vector3 {
  UniformValue<Vector3, Float> get asUniform => UniformValue.vec3(this);
}

extension UniformVec4Converter on Vector4 {
  UniformValue<Vector4, Float> get asUniform => UniformValue.vec4(this);
}

extension UniformIVec2Converter on IVector2 {
  UniformValue<IVector2, Int32> get asUniform => UniformValue.ivec2(this);
}

extension UniformIVec3Converter on IVector3 {
  UniformValue<IVector3, Int32> get asUniform => UniformValue.ivec3(this);
}

extension UniformIVec4Converter on IVector4 {
  UniformValue<IVector4, Int32> get asUniform => UniformValue.ivec4(this);
}

extension UniformListIntConverter on List<int> {
  List<UniformValue<int, Int32>> toUniformData() =>
      map(UniformValue.integer).toList();
}

extension UniformListFloatConverter on List<double> {
  List<UniformValue<double, Float>> toUniformData() =>
      map(UniformValue.float).toList();
}

extension UniformListVec2Converter on List<Vector2> {
  List<UniformValue<Vector2, Float>> toUniformData() =>
      map(UniformValue.vec2).toList();
}

extension UniformListVec3Converter on List<Vector3> {
  List<UniformValue<Vector3, Float>> toUniformData() =>
      map(UniformValue.vec3).toList();
}

extension UniformListVec4Converter on List<Vector4> {
  List<UniformValue<Vector4, Float>> toUniformData() =>
      map(UniformValue.vec4).toList();
}

extension UniformListIVec2Converter on List<IVector2> {
  List<UniformValue<IVector2, Int32>> toUniformData() =>
      map(UniformValue.ivec2).toList();
}

extension UniformListIVec3Converter on List<IVector3> {
  List<UniformValue<IVector3, Int32>> toUniformData() =>
      map(UniformValue.ivec3).toList();
}

extension UniformListIVec4Converter on List<IVector4> {
  List<UniformValue<IVector4, Int32>> toUniformData() =>
      map(UniformValue.ivec4).toList();
}
