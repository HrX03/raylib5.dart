part of '../../raylib.dart';

mixin _CoreCameraModule on _RayLibBase {
  void updateCamera(Camera camera, CameraMode mode) =>
      native.UpdateCamera(camera.getPointer(), mode.index);

  void updateCameraPro(
    Camera camera,
    Vector3 movement,
    Vector3 rotation,
    double zoom,
  ) =>
      native.UpdateCameraPro(
        camera.getPointer(),
        movement.ref,
        rotation.ref,
        zoom,
      );
}
