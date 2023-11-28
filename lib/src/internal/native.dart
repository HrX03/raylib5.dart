import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/raylib.dart';
import 'package:raylib/src/generated_raylib.dart';

export 'dart:ffi';
export 'package:ffi/ffi.dart';

abstract class NativeClass<T extends Struct> {
  Pointer<T>? pointer;
  late final T ref;

  NativeClass();
  NativeClass.fromRef(this.ref) : pointer = null;

  void dispose() {
    if (this is Unloadable && isRayLibInZonedMode) {
      (this as Unloadable).unload(zoneRayLib.native);
    }
    if (pointer != null) calloc.free(pointer!);
  }
}

mixin Pointable<T extends Struct> on NativeClass<T> {
  @override
  T get ref;

  Pointer<T> getPointer();
}

mixin Unloadable<T extends Struct> on NativeClass<T> {
  void unload(RayLibNative native);
}
