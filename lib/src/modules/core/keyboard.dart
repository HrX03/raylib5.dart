part of '../../raylib.dart';

mixin _CoreKeyboardModule on _RayLibBase {
  bool isKeyPressed(KeyboardKey key) => _native.IsKeyPressed(key.keyCode);

  bool isKeyPressedRepeat(KeyboardKey key) =>
      _native.IsKeyPressedRepeat(key.keyCode);

  bool isKeyDown(KeyboardKey key) => _native.IsKeyDown(key.keyCode);

  bool isKeyReleased(KeyboardKey key) => _native.IsKeyReleased(key.keyCode);

  bool isKeyUp(KeyboardKey key) => _native.IsKeyUp(key.keyCode);

  KeyboardKey getKeyPressed() =>
      KeyboardKey.fromKeyCode(_native.GetKeyPressed());

  int getCharPressed() => _native.GetCharPressed();

  void setExitKey(KeyboardKey key) => _native.SetExitKey(key.keyCode);
}
