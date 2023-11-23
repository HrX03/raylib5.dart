part of '../../raylib.dart';

mixin _CoreDrawModule on _RayLibBase {
  void clearBackground(Color color) => _native.ClearBackground(color.ref);
  void beginDrawing() => _native.BeginDrawing();
  void endDrawing() => _native.EndDrawing();
  void beginMode2D(Camera2D camera) => _native.BeginMode2D(camera.ref);
  void endMode2D() => _native.EndMode2D();
  void beginMode3D(Camera3D camera) => _native.BeginMode3D(camera.ref);
  void endMode3D() => _native.EndMode3D();
  void beginTextureMode(RenderTexture2D target) =>
      _native.BeginTextureMode(target.ref);
  void endTextureMode() => _native.EndTextureMode();
  void beginShaderMode(Shader shader) => _native.BeginShaderMode(shader.ref);
  void endShaderMode() => _native.EndShaderMode();
  void beginBlendMode(BlendMode mode) => _native.BeginBlendMode(mode.index);
  void endBlendMode() => _native.EndBlendMode();
  void beginScissorMode(int x, int y, int width, int height) =>
      _native.BeginScissorMode(x, y, width, height);
  void endScissorMode() => _native.EndScissorMode();
  void beginVrStereoMode(VrStereoConfig config) =>
      _native.BeginVrStereoMode(config.ref);
  void endVrStereoMode() => _native.EndVrStereoMode();

  void drawText(String text, int x, int y, int fontSize, Color color) {
    return using(
      (arena) => _native.DrawText(
        text.toNativeUtf8(allocator: arena).cast(),
        x,
        y,
        fontSize,
        color.ref,
      ),
    );
  }
}
