import 'dart:ffi';

import 'package:ffi/ffi.dart';

class NativeClass<T extends Struct> {
  late final Pointer<T>? pointer;
  late final T ref;

  NativeClass();
  NativeClass.fromRef(this.ref) : pointer = null;

  void free() {
    if (pointer != null) calloc.free(pointer!);
  }
}
