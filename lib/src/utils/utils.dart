import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/base/types.dart';
import 'package:raylib/src/classes/image.dart';
import 'package:raylib/src/classes/matrix.dart';
import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

Pointer<raylib.Image> imageListToPointer(
  List<Image> data, {
  Allocator allocator = calloc,
}) {
  final cArray = allocator<raylib.Image>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<raylib.Vector2> vector2ListToPointer<N extends Struct>(
  List<Vector2> data, {
  Allocator allocator = calloc,
}) {
  final cArray = allocator<raylib.Vector2>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<Uint8> byteListToUintPointer(
  Uint8List data, {
  bool nullTerminate = false,
  Allocator allocator = calloc,
}) {
  final size = data.length + (nullTerminate ? 1 : 0);
  final pointer = allocator<Uint8>(size);

  for (int i = 0; i < data.length; i++) {
    pointer[i] = data[i];
  }

  return pointer;
}

Uint8List uintPointerToByteList(Pointer<Uint8> pointer, int size) {
  //return pointer.asTypedList(size);
  final data = Uint8List(size);
  for (int i = 0; i < data.length; i++) {
    data[i] = pointer[i];
  }

  return data;
}

extension MatrixArrayCopy2 on Array<raylib.Matrix> {
  void push(Array2<Matrix> pair) {
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

extension FloatArrayCopy on Array<Float> {
  void push2(Array2<double> pair) {
    this[0] = pair.$1;
    this[1] = pair.$2;
  }

  void push4(Array4<double> quad) {
    this[0] = quad.$1;
    this[1] = quad.$2;
    this[2] = quad.$3;
    this[3] = quad.$4;
  }
}

extension IntArrayCopy on Array<Int32> {
  void push4(Array4<int> quad) {
    this[0] = quad.$1;
    this[1] = quad.$2;
    this[2] = quad.$3;
    this[3] = quad.$4;
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
