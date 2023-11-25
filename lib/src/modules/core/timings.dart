part of '../../raylib.dart';

mixin _CoreTimingsModule on _RayLibBase {
  void setTargetFPS(int fps) => native.SetTargetFPS(fps);

  double getFrameTime() => native.GetFrameTime();

  double getTime() => native.GetTime();

  int getFPS() => native.GetFPS();
}
