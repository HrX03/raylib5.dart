part of '../../raylib.dart';

mixin _CoreScreenSpaceModule on _RayLibBase {
  Ray getMouseRay(Vector2 mousePosition, Camera camera) =>
      Ray.fromRef(_native.GetMouseRay(mousePosition.ref, camera.ref));

  Matrix getCameraMatrix(Camera camera) =>
      Matrix.fromRef(_native.GetCameraMatrix(camera.ref));

  Matrix getCameraMatrix2D(Camera2D camera) =>
      Matrix.fromRef(_native.GetCameraMatrix2D(camera.ref));

  Vector2 getWorldToScreen(Vector3 position, Camera camera) =>
      Vector2.fromRef(_native.GetWorldToScreen(position.ref, camera.ref));

  Vector2 getScreenToWorld2D(Vector2 position, Camera2D camera) =>
      Vector2.fromRef(_native.GetScreenToWorld2D(position.ref, camera.ref));

  Vector2 getWorldToScreenEx(
    Vector3 position,
    Camera camera,
    int width,
    int height,
  ) =>
      Vector2.fromRef(
        _native.GetWorldToScreenEx(position.ref, camera.ref, width, height),
      );

  Vector2 getWorldToScreen2D(Vector2 position, Camera2D camera) =>
      Vector2.fromRef(_native.GetWorldToScreen2D(position.ref, camera.ref));
}
