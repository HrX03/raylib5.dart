import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/classes/image.dart';
import 'package:raylib/src/classes/matrix.dart';
import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

Pointer<raylib.Image> imageListToPointer(List<Image> data) {
  final cArray = calloc<raylib.Image>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<raylib.Vector2> vector2ListToPointer<N extends Struct>(
  List<Vector2> data,
) {
  final cArray = calloc<raylib.Vector2>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

extension MatrixArrayCopy2 on Array<raylib.Matrix> {
  void push((Matrix, Matrix) pair) {
    for (int i = 0; i < 2; i++) {
      this[i].m0 = pair[i].m0;
      this[i].m1 = pair[i].m1;
      this[i].m2 = pair[i].m2;
      this[i].m3 = pair[i].m3;
      this[i].m4 = pair[i].m4;
      this[i].m5 = pair[i].m5;
      this[i].m6 = pair[i].m6;
      this[i].m7 = pair[i].m7;
      this[i].m8 = pair[i].m8;
      this[i].m9 = pair[i].m9;
      this[i].m10 = pair[i].m10;
      this[i].m11 = pair[i].m11;
      this[i].m12 = pair[i].m12;
    }
  }
}

extension FloatArrayCopy2 on Array<Float> {
  void push((double, double) pair) {
    this[0] = pair.$1;
    this[1] = pair.$2;
  }
}

extension RecordIndexAccess2<T> on (T, T) {
  T operator [](int index) {
    return switch (index) {
      0 => $1,
      1 => $2,
      _ => throw ArgumentError.value(index),
    };
  }
}
