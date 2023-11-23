enum WindowFlag {
  /// Set to try enabling V-Sync on GPU
  vsyncHint(0x00000040),

  /// Set to run program in fullscreen
  fullscreenMode(0x00000002),

  /// Set to allow resizable window
  resizable(0x00000004),

  /// Set to disable window decoration (frame and buttons)
  undecorated(0x00000008),

  /// Set to hide window
  hidden(0x00000080),

  /// Set to minimize window (iconify)
  minimized(0x00000200),

  /// Set to maximize window (expanded to monitor)
  maximized(0x00000400),

  /// Set to window non focused
  unfocused(0x00000800),

  /// Set to window always on top
  topmost(0x00001000),

  /// Set to allow windows running while minimized
  alwaysRun(0x00000100),

  /// Set to allow transparent framebuffer
  transparent(0x00000010),

  /// Set to support HighDPI
  highdpi(0x00002000),

  /// Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
  mousePassthrough(0x00004000),

  /// Set to run program in borderless windowed mode
  borderlessWindowMode(0x00008000),

  /// Set to try enabling MSAA 4X
  msaa4xHint(0x00000020),

  /// Set to try enabling interlaced video format (for V3D)
  interlacedHint(0x00010000);

  final int value;
  const WindowFlag(this.value);
}

extension FlagApplier on Set<WindowFlag> {
  int apply() {
    return fold(0, (p, e) => p | e.value);
  }
}
