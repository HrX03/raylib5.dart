import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Matrix extends NativeClass<raylib.Matrix> {
  Matrix.fromRef(super.ref) : super.fromRef();

  double get m0 => ref.m0;
  double get m4 => ref.m4;
  double get m8 => ref.m8;
  double get m12 => ref.m12;
  double get m1 => ref.m1;
  double get m5 => ref.m5;
  double get m9 => ref.m9;
  double get m13 => ref.m13;
  double get m2 => ref.m2;
  double get m6 => ref.m6;
  double get m10 => ref.m10;
  double get m14 => ref.m14;
  double get m3 => ref.m3;
  double get m7 => ref.m7;
  double get m11 => ref.m11;
  double get m15 => ref.m15;

  set m0(double m0) => ref.m0 = m0;
  set m4(double m4) => ref.m4 = m4;
  set m8(double m8) => ref.m8 = m8;
  set m12(double m12) => ref.m12 = m12;
  set m1(double m1) => ref.m1 = m1;
  set m5(double m5) => ref.m5 = m5;
  set m9(double m9) => ref.m9 = m9;
  set m13(double m13) => ref.m13 = m13;
  set m2(double m2) => ref.m2 = m2;
  set m6(double m6) => ref.m6 = m6;
  set m10(double m10) => ref.m10 = m10;
  set m14(double m14) => ref.m14 = m14;
  set m3(double m3) => ref.m3 = m3;
  set m7(double m7) => ref.m7 = m7;
  set m11(double m11) => ref.m11 = m11;
  set m15(double m15) => ref.m15 = m15;
}
