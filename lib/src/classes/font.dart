import 'package:raylib/src/classes/glyph_info.dart';
import 'package:raylib/src/classes/rectangle.dart';
import 'package:raylib/src/classes/texture.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Font extends NativeClass<raylib.Font> {
  Font.fromRef(super.ref) : super.fromRef();

  int get baseSize => ref.baseSize;

  int get glyphCount => ref.glyphCount;

  int get glyphPadding => ref.glyphPadding;

  Texture2D get texture => Texture.fromRef(ref.texture);

  List<Rectangle> getRects() {
    final List<Rectangle> events = [];
    for (int i = 0; i < ref.glyphCount; i++) {
      events.add(Rectangle.fromRef(ref.recs[i]));
    }

    return events;
  }

  List<GlyphInfo> getGlyphs() {
    final List<GlyphInfo> events = [];
    for (int i = 0; i < ref.glyphCount; i++) {
      events.add(GlyphInfo.fromRef(ref.glyphs[i]));
    }

    return events;
  }
}
