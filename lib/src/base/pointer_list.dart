import 'dart:ffi';

class PointerList<V extends NativeType, E, T> {
  const PointerList(this.pointer, this.transformer);

  final Pointer<V> pointer;
  final T Function(E) transformer;
}

extension IntPointerList<T> on PointerList<Int, int, T> {
  T operator [](int index) {
    return transformer(pointer[index]);
  }
}
