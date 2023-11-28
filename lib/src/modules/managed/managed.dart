part of '../../raylib.dart';

mixin _ManagedModule on _RayLibBase {
  void drawingScope(void Function() scope) {
    beginDrawing();
    scope();
    endDrawing();
  }

  void mode2DScope(Camera2D camera, void Function() scope) {
    beginMode2D(camera);
    scope();
    endMode2D();
  }

  void mode3DScope(Camera3D camera, void Function() scope) {
    beginMode3D(camera);
    scope();
    endMode3D();
  }

  void textureModeScope(RenderTexture2D texture, void Function() scope) {
    beginTextureMode(texture);
    scope();
    endTextureMode();
  }

  void shaderModeScope(Shader shader, void Function() scope) {
    beginShaderMode(shader);
    scope();
    endShaderMode();
  }

  void blendModeScope(BlendMode blendMode, void Function() scope) {
    beginBlendMode(blendMode);
    scope();
    endBlendMode();
  }

  void scissorModeScope(
    int x,
    int y,
    int width,
    int height,
    void Function() scope,
  ) {
    beginScissorMode(x, y, width, height);
    scope();
    endScissorMode();
  }

  void vrStereoModeScope(VrStereoConfig config, void Function() scope) {
    beginVrStereoMode(config);
    scope();
    endVrStereoMode();
  }
}
