import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/classes/image.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class GlyphInfo extends NativeClass<raylib.GlyphInfo> {
  GlyphInfo.fromRef(super.ref) : super.fromRef();

  @override
  Pointer<raylib.GlyphInfo> getReference() {
    pointer ??= calloc<raylib.GlyphInfo>();
    pointer!.ref = ref;
    return pointer!;
  }

  int get value => ref.value;
  int get offsetX => ref.offsetX;
  int get offsetY => ref.offsetY;
  int get advanceX => ref.advanceX;
  Image get image => Image.fromRef(image.ref);
}
