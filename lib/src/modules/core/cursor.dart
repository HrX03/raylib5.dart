part of '../../raylib.dart';

mixin _CoreCursorModule on _RayLibBase {
  void showCursor() => native.ShowCursor();

  void hideCursor() => native.HideCursor();

  bool isCursorHidden() => native.IsCursorHidden();

  void enableCursor() => native.EnableCursor();

  void disableCursor() => native.DisableCursor();

  bool isCursorOnScreen() => native.IsCursorOnScreen();
}
