part of '../../raylib.dart';

mixin _CoreGesturesModule on _RayLibBase {
  void setGesturesEnabled(Set<Gesture> flags) =>
      native.SetGesturesEnabled(flags.apply());

  bool isGestureDetected(Gesture gesture) =>
      native.IsGestureDetected(gesture.value);

  Gesture getGestureDetected() =>
      Gesture.fromValue(native.GetGestureDetected());

  double getGestureHoldDuration() => native.GetGestureHoldDuration();

  Vector2 getGestureDragVector() =>
      Vector2.fromRef(native.GetGestureDragVector());

  double getGestureDragAngle() => native.GetGestureDragAngle();

  Vector2 getGesturePinchVector() =>
      Vector2.fromRef(native.GetGesturePinchVector());

  double getGesturePinchAngle() => native.GetGesturePinchAngle();
}
