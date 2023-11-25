enum ConfigFlag {
  vsyncHint(0x00000040),
  fullscreenMode(0x00000002),
  resizable(0x00000004),
  undecorated(0x00000008),
  hidden(0x00000080),
  minimized(0x00000200),
  maximized(0x00000400),
  unfocused(0x00000800),
  topmost(0x00001000),
  alwaysRun(0x00000100),
  transparent(0x00000010),
  highdpi(0x00002000),
  mousePassthrough(0x00004000),
  borderlessWindowMode(0x00008000),
  msaa4xHint(0x00000020),
  interlacedHint(0x00010000);

  final int value;

  const ConfigFlag(this.value);
}

extension ConfigFlagApplier on Set<ConfigFlag> {
  int apply() {
    return fold(0, (p, e) => p | e.value);
  }
}
