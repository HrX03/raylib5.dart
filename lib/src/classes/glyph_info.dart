import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/classes/image.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class GlyphInfo extends NativeClass<raylib.GlyphInfo> {
  GlyphInfo.fromRef(super.ref) : super.fromRef();

  int get value => ref.value;
  int get offsetX => ref.offsetX;
  int get offsetY => ref.offsetY;
  int get advanceX => ref.advanceX;
  Image get image => Image.fromRef(image.ref);
}
