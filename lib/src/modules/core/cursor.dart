part of '../../raylib.dart';

mixin _CoreCursorModule on _RayLibBase {
  void showCursor() => _native.ShowCursor();
  void hideCursor() => _native.HideCursor();
  bool isCursorHidden() => _native.IsCursorHidden();
  void enableCursor() => _native.EnableCursor();
  void disableCursor() => _native.DisableCursor();
  bool isCursorOnScreen() => _native.IsCursorOnScreen();
}
