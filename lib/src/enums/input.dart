enum MouseCursor {
  defaultCursor,
  arrow,
  ibeam,
  crosshair,
  pointingHand,
  resizeEW,
  resizeNS,
  resizeNWSE,
  resizeNESW,
  resizeAll,
  noAllowed,
}

enum MouseButton { left, right, middle, side, extra, forward, back }

enum KeyboardKey {
  none(0),
  apostrophe(39),
  comma(44),
  minus(45),
  period(46),
  slash(47),
  zero(48),
  one(49),
  two(50),
  three(51),
  four(52),
  five(53),
  six(54),
  seven(55),
  eight(56),
  nine(57),
  semicolon(59),
  equal(61),
  a(65),
  b(66),
  c(67),
  d(68),
  e(69),
  f(70),
  g(71),
  h(72),
  i(73),
  j(74),
  k(75),
  l(76),
  m(77),
  n(78),
  o(79),
  p(80),
  q(81),
  r(82),
  s(83),
  t(84),
  u(85),
  v(86),
  w(87),
  x(88),
  y(89),
  z(90),
  leftBracket(91),
  backslash(92),
  rightBracket(93),
  grave(96),
  space(32),
  escape(256),
  enter(257),
  tab(258),
  backspace(259),
  insert(260),
  delete(261),
  right(262),
  left(263),
  down(264),
  up(265),
  pageUp(266),
  pageDown(267),
  home(268),
  end(269),
  capsLock(280),
  scrollLock(281),
  numLock(282),
  printScreen(283),
  pause(284),
  f1(290),
  f2(291),
  f3(292),
  f4(293),
  f5(294),
  f6(295),
  f7(296),
  f8(297),
  f9(298),
  f10(299),
  f11(300),
  f12(301),
  leftShift(340),
  leftControl(341),
  leftAlt(342),
  leftSuper(343),
  rightShift(344),
  rightControl(345),
  rightAlt(346),
  rightSuper(347),
  kbMenu(348),
  kp0(320),
  kp1(321),
  kp2(322),
  kp3(323),
  kp4(324),
  kp5(325),
  kp6(326),
  kp7(327),
  kp8(328),
  kp9(329),
  kpDecimal(330),
  kpDivide(331),
  kpMultiply(332),
  kpSubtract(333),
  kpAdd(334),
  kpEnter(335),
  kpEqual(336),
  back(4),
  menu(82),
  volumeUp(24),
  volumeDown(25);

  final int keyCode;

  const KeyboardKey(this.keyCode);

  factory KeyboardKey.fromKeyCode(int keyCode) {
    return KeyboardKey.values.firstWhere(
      (e) => e.keyCode == keyCode,
      orElse: () => throw ArgumentError.value(keyCode, "keyCode"),
    );
  }
}

enum GamepadButton {
  unknown,
  leftFaceUp,
  leftFaceRight,
  leftFaceDown,
  leftFaceLeft,
  rightFaceUp,
  rightFaceRight,
  rightFaceDown,
  rightFaceLeft,
  leftTrigger1,
  leftTrigger2,
  rightTrigger1,
  rightTrigger2,
  middleLeft,
  middle,
  middleRight,
  leftThumb,
  rightThumb,
}

enum GamepadAxis { leftX, leftY, rightX, rightY, leftTrigger, rightTrigger }

enum Gesture {
  none,
  tap,
  doubleTap,
  hold,
  drag,
  swipeRight,
  swipeLeft,
  swipeUp,
  swipeDown,
  pinchIn,
  pinchOut;

  int get value => 2 << index;

  factory Gesture.fromValue(int value) {
    return Gesture.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError.value(value, "value"),
    );
  }
}

extension GestureApplier on Set<Gesture> {
  int apply() {
    return fold(0, (p, e) => p | e.value);
  }
}
