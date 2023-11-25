enum AutomationEventType {
  none,

  inputKeyUp,
  inputKeyDown,
  inputKeyPressed,
  inputKeyReleased,
  inputMouseButtonUp,
  inputMouseButtonDown,
  inputMousePosition,
  inputMouseWheelMotion,
  inputGamepadConnect,
  inputGamepadDisconnect,
  inputGamepadButtonUp,
  inputGamepadButtonDown,
  inutGamepadAxisMotion,
  inputTouchUp,
  inputTouchDown,
  inputTouchPosition,
  inputGesture,

  windowClose,
  windowMaximize,
  windowMinimize,
  windowResize,

  actionTakeScreenshot,
  actionSetTargetFPS,
}
