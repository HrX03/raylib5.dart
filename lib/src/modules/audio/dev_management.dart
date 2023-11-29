part of '../../raylib.dart';

mixin _AudioDevManagementModule on _RayLibBase {
  void initAudioDevice() => native.InitAudioDevice();

  void closeAudioDevice() => native.CloseAudioDevice();

  bool isAudioDeviceReady() => native.IsAudioDeviceReady();

  void setMasterVolume(double volume) => native.SetMasterVolume(volume);

  double getMasterVolume() => native.GetMasterVolume();
}
