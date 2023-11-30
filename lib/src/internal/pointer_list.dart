import 'dart:ffi';

import 'package:raylib/src/classes/material.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class PointerList<V extends NativeType> {
  const PointerList(this.pointer);

  final Pointer<V> pointer;
}

class TransformablePointerList<V extends NativeType, T> extends PointerList<V> {
  const TransformablePointerList(super.pointer, this.transformer);

  final T Function(V) transformer;
}

extension IntPointerList on PointerList<Int> {
  int operator [](int index) {
    return pointer[index];
  }
}

extension FloatPointerList on PointerList<Float> {
  double operator [](int index) {
    return pointer[index];
  }
}

extension MaterialMapPointerList
    on TransformablePointerList<raylib.MaterialMap, MaterialMap> {
  MaterialMap operator [](int index) {
    return transformer(pointer[index]);
  }
}
