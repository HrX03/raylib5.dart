part of '../../raylib.dart';

mixin _CoreKeyboardModule on _RayLibBase {
  bool isKeyPressed(KeyboardKey key) => native.IsKeyPressed(key.keyCode);

  bool isKeyPressedRepeat(KeyboardKey key) =>
      native.IsKeyPressedRepeat(key.keyCode);

  bool isKeyDown(KeyboardKey key) => native.IsKeyDown(key.keyCode);

  bool isKeyReleased(KeyboardKey key) => native.IsKeyReleased(key.keyCode);

  bool isKeyUp(KeyboardKey key) => native.IsKeyUp(key.keyCode);

  KeyboardKey getKeyPressed() =>
      KeyboardKey.fromKeyCode(native.GetKeyPressed());

  int getCharPressed() => native.GetCharPressed();

  void setExitKey(KeyboardKey key) => native.SetExitKey(key.keyCode);
}
