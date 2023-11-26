part of '../../raylib.dart';

mixin _CoreDrawModule on _RayLibBase {
  void clearBackground(Color color) => native.ClearBackground(color.ref);

  void beginDrawing() => native.BeginDrawing();

  void endDrawing() => native.EndDrawing();

  void beginMode2D(Camera2D camera) => native.BeginMode2D(camera.ref);

  void endMode2D() => native.EndMode2D();

  void beginMode3D(Camera3D camera) => native.BeginMode3D(camera.ref);

  void endMode3D() => native.EndMode3D();

  void beginTextureMode(RenderTexture2D target) =>
      native.BeginTextureMode(target.ref);

  void endTextureMode() => native.EndTextureMode();

  void beginShaderMode(Shader shader) => native.BeginShaderMode(shader.ref);

  void endShaderMode() => native.EndShaderMode();

  void beginBlendMode(BlendMode mode) => native.BeginBlendMode(mode.index);

  void endBlendMode() => native.EndBlendMode();

  void beginScissorMode(int x, int y, int width, int height) =>
      native.BeginScissorMode(x, y, width, height);

  void endScissorMode() => native.EndScissorMode();

  void beginVrStereoMode(VrStereoConfig config) =>
      native.BeginVrStereoMode(config.ref);

  void endVrStereoMode() => native.EndVrStereoMode();
}
