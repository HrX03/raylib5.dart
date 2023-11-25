import 'dart:ffi';

class PointerList<V extends NativeType> {
  const PointerList(this.pointer);

  final Pointer<V> pointer;
}

extension IntPointerList on PointerList<Int> {
  int operator [](int index) {
    return pointer[index];
  }
}
