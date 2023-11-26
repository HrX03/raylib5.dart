import 'dart:ffi';

import 'package:ffi/ffi.dart';

export 'dart:ffi';
export 'package:ffi/ffi.dart';

abstract class NativeClass<T extends Struct> {
  Pointer<T>? pointer;
  late final T ref;

  NativeClass();
  NativeClass.fromRef(this.ref) : pointer = null;

  void free() {
    if (pointer != null) calloc.free(pointer!);
  }
}

mixin Pointable<T extends Struct> on NativeClass<T> {
  @override
  T get ref;

  Pointer<T> getPointer();
}
