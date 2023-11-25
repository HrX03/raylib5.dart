part of '../../raylib.dart';

mixin _CoreTouchModule on _RayLibBase {
  int getTouchX() => native.GetTouchX();

  int getTouchY() => native.GetTouchY();

  Vector2 getTouchPosition(int index) =>
      Vector2.fromRef(native.GetTouchPosition(index));

  int getTouchPointId(int index) => native.GetTouchPointId(index);

  int getTouchPointCount() => native.GetTouchPointCount();
}
