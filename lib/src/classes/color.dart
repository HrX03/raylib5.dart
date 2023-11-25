import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class Color extends NativeClass<raylib.Color> {
  Color(int r, int g, int b, int a) {
    pointer = calloc<raylib.Color>();
    ref = pointer!.ref;
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }

  Color.fromRef(super.ref) : super.fromRef();

  @override
  Pointer<raylib.Color> getReference() {
    pointer ??= calloc<raylib.Color>();
    pointer!.ref = ref;
    return pointer!;
  }

  int get r => ref.r;
  int get g => ref.g;
  int get b => ref.b;
  int get a => ref.a;

  set r(int r) => ref.r = r;
  set g(int g) => ref.g = g;
  set b(int b) => ref.b = b;
  set a(int a) => ref.a = a;

  static final lightGray = Color(200, 200, 200, 255);
  static final gray = Color(130, 130, 130, 255);
  static final darkGray = Color(80, 80, 80, 255);
  static final yellow = Color(253, 249, 0, 255);
  static final gold = Color(255, 203, 0, 255);
  static final orange = Color(255, 161, 0, 255);
  static final pink = Color(255, 109, 194, 255);
  static final red = Color(230, 41, 55, 255);
  static final maroon = Color(190, 33, 55, 255);
  static final green = Color(0, 228, 48, 255);
  static final lime = Color(0, 158, 47, 255);
  static final darkGreen = Color(0, 117, 44, 255);
  static final skyBlue = Color(102, 191, 255, 255);
  static final blue = Color(0, 121, 241, 255);
  static final darkBlue = Color(0, 82, 172, 255);
  static final purple = Color(200, 122, 255, 255);
  static final violet = Color(135, 60, 190, 255);
  static final darkPurple = Color(112, 31, 126, 255);
  static final beige = Color(211, 176, 131, 255);
  static final brown = Color(127, 106, 79, 255);
  static final darkBrown = Color(76, 63, 47, 255);
  static final white = Color(255, 255, 255, 255);
  static final black = Color(0, 0, 0, 255);
  static final blank = Color(0, 0, 0, 0);
  static final magenta = Color(255, 0, 255, 255);
  static final rayWhite = Color(245, 245, 245, 255);
}
