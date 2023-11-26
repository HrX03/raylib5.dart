part of '../../raylib.dart';

mixin _TextInfoModule on _RayLibBase {
  void setTextLineSpacing(int spacing) => native.SetTextLineSpacing(spacing);

  int measureText(String text, int fontSize) {
    return using(
      (arena) => native.MeasureText(
        text.toNativeUtf8(allocator: arena).cast(),
        fontSize,
      ),
    );
  }

  Vector2 measureTextEx(
    Font font,
    String text,
    double fontSize,
    double spacing,
  ) {
    return using(
      (arena) => Vector2.fromRef(
        native.MeasureTextEx(
          font.ref,
          text.toNativeUtf8(allocator: arena).cast(),
          fontSize,
          spacing,
        ),
      ),
    );
  }

  int getGlyphIndex(Font font, int codepoint) =>
      native.GetGlyphIndex(font.ref, codepoint);

  GlyphInfo getGlyphInfo(Font font, int codepoint) =>
      GlyphInfo.fromRef(native.GetGlyphInfo(font.ref, codepoint));

  Rectangle getGlyphAtlasRec(Font font, int codepoint) =>
      Rectangle.fromRef(native.GetGlyphAtlasRec(font.ref, codepoint));
}
