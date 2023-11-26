import 'package:raylib/src/enums/textures.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Image extends NativeClass<raylib.Image> with Pointable<raylib.Image> {
  Image.fromRef(super.ref) : super.fromRef();

  @override
  raylib.Image get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.Image> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.Image>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  int get width => ref.width;
  int get height => ref.height;
  int get mipmaps => ref.mipmaps;
  PixelFormat get format => PixelFormat.values[ref.format - 1];
}
