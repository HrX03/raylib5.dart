part of '../../raylib.dart';

mixin _TextDrawingModule on _RayLibBase {
  void drawFPS(int posX, int posY) => native.DrawFPS(posX, posY);

  void drawText(String text, int x, int y, int fontSize, Color color) {
    return using(
      (arena) => native.DrawText(
        text.toNativeUtf8(allocator: arena).cast(),
        x,
        y,
        fontSize,
        color.ref,
      ),
    );
  }

  void drawTextEx(
    Font font,
    String text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) {
    return using(
      (arena) => native.DrawTextEx(
        font.ref,
        text.toNativeUtf8(allocator: arena).cast(),
        position.ref,
        fontSize,
        spacing,
        tint.ref,
      ),
    );
  }

  void drawTextPro(
    Font font,
    String text,
    Vector2 position,
    Vector2 origin,
    double rotation,
    double fontSize,
    double spacing,
    Color tint,
  ) {
    return using(
      (arena) => native.DrawTextPro(
        font.ref,
        text.toNativeUtf8(allocator: arena).cast(),
        position.ref,
        origin.ref,
        rotation,
        fontSize,
        spacing,
        tint.ref,
      ),
    );
  }

  void drawTextCodepoint(
    Font font,
    int codepoint,
    Vector2 position,
    double fontSize,
    Color tint,
  ) =>
      native.DrawTextCodepoint(
        font.ref,
        codepoint,
        position.ref,
        fontSize,
        tint.ref,
      );

  void drawTextCodepoints(
    Font font,
    List<int> codepoints,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) {
    return using(
      (arena) => native.DrawTextCodepoints(
        font.ref,
        codepointsToPointer(codepoints, allocator: arena),
        codepoints.length,
        position.ref,
        fontSize,
        spacing,
        tint.ref,
      ),
    );
  }
}
