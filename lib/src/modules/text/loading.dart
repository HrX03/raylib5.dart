part of '../../raylib.dart';

mixin _TextLoadingModule on _RayLibBase {
  Font getFontDefault() => Font.fromRef(native.GetFontDefault());

  Font loadFont(String fileName) {
    return using(
      (arena) => Font.fromRef(
        native.LoadFont(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Font loadFontEx(
    String fileName,
    int fontSize, [
    List<int>? codepoints,
  ]) {
    return using(
      (arena) => Font.fromRef(
        native.LoadFontEx(
          fileName.toNativeUtf8(allocator: arena).cast(),
          fontSize,
          codepointsToPointer(codepoints, allocator: arena),
          codepoints?.length ?? 0,
        ),
      ),
    );
  }

  Font loadFontFromImage(Image image, Color key, int firstChar) =>
      Font.fromRef(native.LoadFontFromImage(image.ref, key.ref, firstChar));

  Font loadFontFromMemory(
    String fileType,
    Uint8List fileData,
    int fontSize, [
    List<int>? codepoints,
  ]) {
    return using(
      (arena) => Font.fromRef(
        native.LoadFontFromMemory(
          fileType.toNativeUtf8(allocator: arena).cast(),
          byteListToUintPointer(fileData, allocator: arena).cast(),
          fileData.length,
          fontSize,
          codepointsToPointer(codepoints, allocator: arena),
          codepoints?.length ?? 0,
        ),
      ),
    );
  }

  bool isFontReady(Font font) => native.IsFontReady(font.ref);

  List<GlyphInfo> loadFontData(
    Uint8List fileData,
    int fontSize,
    List<int>? codepoints,
    FontType type,
  ) {
    return using((arena) {
      final glyphInfoP = native.LoadFontData(
        byteListToUintPointer(fileData, allocator: arena).cast(),
        fileData.length,
        fontSize,
        codepointsToPointer(codepoints, allocator: arena),
        codepoints?.length ?? 0,
        type.index,
      );

      final glyphCount = codepoints?.length ?? 95;
      final List<GlyphInfo> infos = [];
      for (int i = 0; i < glyphCount; i++) {
        infos.add(GlyphInfo.fromRef(glyphInfoP[i]));
      }

      native.UnloadFontData(glyphInfoP, glyphCount);

      return infos;
    });
  }

  Image genImageFontAtlas(
    List<GlyphInfo> glyphs,
    List<Rectangle> glyphRecs,
    int fontSize,
    int padding,
    FontAtlasPackingMode packMethod,
  ) {
    assert(glyphs.length == glyphRecs.length);

    return using((arena) {
      final rectangles = rectangleListToPointer(glyphRecs, allocator: arena);
      final rectanglesP = arena<Pointer<raylib.Rectangle>>();
      rectanglesP.value = rectangles;

      return Image.fromRef(
        native.GenImageFontAtlas(
          glyphInfoListToPointer(glyphs, allocator: arena),
          rectanglesP,
          glyphs.length,
          fontSize,
          padding,
          packMethod.index,
        ),
      );
    });
  }

  void unloadFont(Font font) => native.UnloadFont(font.ref);

  bool exportFontAsCode(Font font, String fileName) {
    return using(
      (arena) => native.ExportFontAsCode(
        font.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }
}
