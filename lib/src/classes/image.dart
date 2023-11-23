import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/enums/pixel_format.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class Image extends NativeClass<raylib.Image> {
  Image(int width, int height, int mipmaps, PixelFormat format) {
    pointer = calloc<raylib.Image>();
    ref = pointer!.ref;
    ref.width = width;
    ref.height = height;
    ref.mipmaps = mipmaps;
    ref.format = format.value;
  }

  Image.fromRef(super.ref) : super.fromRef() {
    pointer = malloc<raylib.Image>(sizeOf<raylib.Image>());
    pointer!.ref.width = ref.width;
    pointer!.ref.height = ref.height;
    pointer!.ref.mipmaps = ref.mipmaps;
    pointer!.ref.format = ref.format;
    ref = pointer!.ref;
  }

  Pointer<Void> get data => ref.data;
  int get width => ref.width;
  int get height => ref.height;
  int get mipmaps => ref.mipmaps;
  PixelFormat get format => PixelFormat.values[ref.format - 1];
}
