part of '../../raylib.dart';

mixin _CoreGamepadModule on _RayLibBase {
  bool isGamepadAvailable(int gamepad) => native.IsGamepadAvailable(gamepad);

  String getGamepadName(int gamepad) =>
      native.GetGamepadName(gamepad).cast<Utf8>().toDartString();

  bool isGamepadButtonPressed(int gamepad, GamepadButton button) =>
      native.IsGamepadButtonPressed(gamepad, button.index);

  bool isGamepadButtonDown(int gamepad, GamepadButton button) =>
      native.IsGamepadButtonDown(gamepad, button.index);

  bool isGamepadButtonReleased(int gamepad, GamepadButton button) =>
      native.IsGamepadButtonReleased(gamepad, button.index);

  bool isGamepadButtonUp(int gamepad, GamepadButton button) =>
      native.IsGamepadButtonUp(gamepad, button.index);

  GamepadButton getGamepadButtonPressed() =>
      GamepadButton.values[native.GetGamepadButtonPressed()];

  int getGamepadAxisCount(int gamepad) => native.GetGamepadAxisCount(gamepad);

  double getGamepadAxisMovement(int gamepad, GamepadAxis axis) =>
      native.GetGamepadAxisMovement(gamepad, axis.index);

  int setGamepadMappings(String mappings) {
    return using(
      (arena) => native.SetGamepadMappings(
        mappings.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }
}
