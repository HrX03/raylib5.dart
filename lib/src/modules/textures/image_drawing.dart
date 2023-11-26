part of '../../raylib.dart';

mixin _TexturesImageDrawingModule on _RayLibBase {
  void imageClearBackground(Image dst, Color color) =>
      native.ImageClearBackground(dst.getPointer(), color.ref);

  void imageDrawPixel(Image dst, int posX, int posY, Color color) =>
      native.ImageDrawPixel(dst.getPointer(), posX, posY, color.ref);

  void imageDrawPixelV(Image dst, Vector2 position, Color color) =>
      native.ImageDrawPixelV(dst.getPointer(), position.ref, color.ref);

  void imageDrawLine(
    Image dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  ) =>
      native.ImageDrawLine(
        dst.getPointer(),
        startPosX,
        startPosY,
        endPosX,
        endPosY,
        color.ref,
      );

  void imageDrawLineV(Image dst, Vector2 start, Vector2 end, Color color) =>
      native.ImageDrawLineV(dst.getPointer(), start.ref, end.ref, color.ref);

  void imageDrawCircle(
    Image dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  ) =>
      native.ImageDrawCircle(
        dst.getPointer(),
        centerX,
        centerY,
        radius,
        color.ref,
      );

  void imageDrawCircleV(Image dst, Vector2 center, int radius, Color color) =>
      native.ImageDrawCircleV(
        dst.getPointer(),
        center.ref,
        radius,
        color.ref,
      );

  void imageDrawCircleLines(
    Image dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  ) =>
      native.ImageDrawCircleLines(
        dst.getPointer(),
        centerX,
        centerY,
        radius,
        color.ref,
      );

  void imageDrawCircleLinesV(
    Image dst,
    Vector2 center,
    int radius,
    Color color,
  ) =>
      native.ImageDrawCircleLinesV(
        dst.getPointer(),
        center.ref,
        radius,
        color.ref,
      );

  void imageDrawRectangle(
    Image dst,
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) =>
      native.ImageDrawRectangle(
        dst.getPointer(),
        posX,
        posY,
        width,
        height,
        color.ref,
      );

  void imageDrawRectangleV(
    Image dst,
    Vector2 position,
    Vector2 size,
    Color color,
  ) =>
      native.ImageDrawRectangleV(
        dst.getPointer(),
        position.ref,
        size.ref,
        color.ref,
      );

  void imageDrawRectangleRec(Image dst, Rectangle rec, Color color) =>
      native.ImageDrawRectangleRec(dst.getPointer(), rec.ref, color.ref);

  void imageDrawRectangleLines(
    Image dst,
    Rectangle rec,
    int thick,
    Color color,
  ) =>
      native.ImageDrawRectangleLines(
        dst.getPointer(),
        rec.ref,
        thick,
        color.ref,
      );

  void imageDraw(
    Image dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  ) =>
      native.ImageDraw(
        dst.getPointer(),
        src.ref,
        srcRec.ref,
        dstRec.ref,
        tint.ref,
      );

  void imageDrawText(
    Image dst,
    String text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  ) {
    return using(
      (arena) => native.ImageDrawText(
        dst.getPointer(),
        text.toNativeUtf8(allocator: arena).cast(),
        posX,
        posY,
        fontSize,
        color.ref,
      ),
    );
  }

  void imageDrawTextEx(
    Image dst,
    Font font,
    String text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) {
    return using(
      (arena) => native.ImageDrawTextEx(
        dst.getPointer(),
        font.ref,
        text.toNativeUtf8(allocator: arena).cast(),
        position.ref,
        fontSize,
        spacing,
        tint.ref,
      ),
    );
  }
}
