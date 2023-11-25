part of '../../raylib.dart';

mixin _CoreVrModule on _RayLibBase {
  VrStereoConfig loadVrStereoConfig(VrDeviceInfo device) =>
      VrStereoConfig.fromRef(native.LoadVrStereoConfig(device.ref));

  void unloadVrStereoConfig(VrStereoConfig config) =>
      native.UnloadVrStereoConfig(config.ref);
}
