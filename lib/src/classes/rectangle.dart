import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class Rectangle extends NativeClass<raylib.Rectangle> {
  Rectangle(double x, double y, double width, double height) {
    pointer = calloc<raylib.Rectangle>();
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  Rectangle.fromRef(super.ref) : super.fromRef();

  double get x => ref.x;
  double get y => ref.y;
  double get width => ref.width;
  double get height => ref.height;

  set x(double x) => ref.x = x;
  set y(double y) => ref.y = y;
  set width(double width) => ref.width = width;
  set height(double height) => ref.height = height;
}
