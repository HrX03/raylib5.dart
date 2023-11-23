part of '../../raylib.dart';

mixin _CoreTimingsModule on _RayLibBase {
  void setTargetFPS(int fps) => _native.SetTargetFPS(fps);
  double getFrameTime() => _native.GetFrameTime();
  double getTime() => _native.GetTime();
  int getFPS() => _native.GetFPS();
}
