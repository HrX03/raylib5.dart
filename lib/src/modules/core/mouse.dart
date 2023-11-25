part of '../../raylib.dart';

mixin _CoreMouseModule on _RayLibBase {
  bool isMouseButtonPressed(MouseButton button) =>
      native.IsMouseButtonPressed(button.index);

  bool isMouseButtonDown(MouseButton button) =>
      native.IsMouseButtonDown(button.index);

  bool isMouseButtonReleased(MouseButton button) =>
      native.IsMouseButtonReleased(button.index);

  bool isMouseButtonUp(MouseButton button) =>
      native.IsMouseButtonUp(button.index);

  int getMouseX() => native.GetMouseX();

  int getMouseY() => native.GetMouseY();

  Vector2 getMousePosition() => Vector2.fromRef(native.GetMousePosition());

  Vector2 getMouseDelta() => Vector2.fromRef(native.GetMouseDelta());

  void setMousePosition(int x, int y) => native.SetMousePosition(x, y);

  void setMouseOffset(int offsetX, int offsetY) =>
      native.SetMouseOffset(offsetX, offsetY);

  void setMouseScale(double scaleX, double scaleY) =>
      native.SetMouseScale(scaleX, scaleY);

  double getMouseWheelMove() => native.GetMouseWheelMove();

  Vector2 getMouseWheelMoveV() => Vector2.fromRef(native.GetMouseWheelMoveV());

  void setMouseCursor(MouseCursor cursor) =>
      native.SetMouseCursor(cursor.index);
}
