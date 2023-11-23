part of '../../raylib.dart';

mixin _CoreMouseModule on _RayLibBase {
  bool isMouseButtonPressed(MouseButton button) =>
      _native.IsMouseButtonPressed(button.index);
  bool isMouseButtonDown(MouseButton button) =>
      _native.IsMouseButtonDown(button.index);
  bool isMouseButtonReleased(MouseButton button) =>
      _native.IsMouseButtonReleased(button.index);
  bool isMouseButtonUp(MouseButton button) =>
      _native.IsMouseButtonUp(button.index);
  int getMouseX() => _native.GetMouseX();
  int getMouseY() => _native.GetMouseY();
  Vector2 getMousePosition() => Vector2.fromRef(_native.GetMousePosition());
  Vector2 getMouseDelta() => Vector2.fromRef(_native.GetMouseDelta());
  void setMousePosition(int x, int y) => _native.SetMousePosition(x, y);
  void setMouseOffset(int offsetX, int offsetY) =>
      _native.SetMouseOffset(offsetX, offsetY);
  void setMouseScale(double scaleX, double scaleY) =>
      _native.SetMouseScale(scaleX, scaleY);
  double getMouseWheelMove() => _native.GetMouseWheelMove();
  Vector2 getMouseWheelMoveV() => Vector2.fromRef(_native.GetMouseWheelMoveV());
  void setMouseCursor(MouseCursor cursor) =>
      _native.SetMouseCursor(cursor.index);
}
