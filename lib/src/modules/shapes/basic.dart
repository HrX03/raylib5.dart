part of '../../raylib.dart';

mixin _ShapesBasicModules on _RayLibBase {
  void setShapesTexture(Texture2D texture, Rectangle source) =>
      native.SetShapesTexture(texture.ref, source.ref);

  void drawPixel(int posX, int posY, Color color) =>
      native.DrawPixel(posX, posY, color.ref);

  void drawPixelV(Vector2 pos, Color color) =>
      native.DrawPixelV(pos.ref, color.ref);

  void drawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  ) =>
      native.DrawLine(startPosX, startPosY, endPosX, endPosY, color.ref);

  void drawLineV(Vector2 startPos, Vector2 endPos, Color color) =>
      native.DrawLineV(startPos.ref, endPos.ref, color.ref);

  void drawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  ) =>
      native.DrawLineEx(startPos.ref, endPos.ref, thick, color.ref);

  void drawLineStrip(List<Vector2> points, Color color) {
    return using(
      (arena) => native.DrawLineStrip(
        vector2ListToPointer(points, allocator: arena),
        points.length,
        color.ref,
      ),
    );
  }

  void drawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  ) =>
      native.DrawLineBezier(startPos.ref, endPos.ref, thick, color.ref);

  void drawCircle(int centerX, int centerY, double radius, Color color) =>
      native.DrawCircle(centerX, centerY, radius, color.ref);

  void drawCircleSector(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) =>
      native.DrawCircleSector(
        center.ref,
        radius,
        startAngle,
        endAngle,
        segments,
        color.ref,
      );

  void drawCircleSectorLines(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) =>
      native.DrawCircleSectorLines(
        center.ref,
        radius,
        startAngle,
        endAngle,
        segments,
        color.ref,
      );

  void drawCircleGradient(
    int centerX,
    int centerY,
    double radius,
    Color color1,
    Color color2,
  ) =>
      native.DrawCircleGradient(
        centerX,
        centerY,
        radius,
        color1.ref,
        color2.ref,
      );

  void drawCircleV(Vector2 center, double radius, Color color) =>
      native.DrawCircleV(center.ref, radius, color.ref);

  void drawCircleLines(int centerX, int centerY, double radius, Color color) =>
      native.DrawCircleLines(centerX, centerY, radius, color.ref);

  void drawCircleLinesV(Vector2 center, double radius, Color color) =>
      native.DrawCircleLinesV(center.ref, radius, color.ref);

  void drawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  ) =>
      native.DrawEllipse(centerX, centerY, radiusH, radiusV, color.ref);

  void drawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  ) =>
      native.DrawEllipseLines(
        centerX,
        centerY,
        radiusH,
        radiusV,
        color.ref,
      );

  void drawRing(
    Vector2 center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) =>
      native.DrawRing(
        center.ref,
        innerRadius,
        outerRadius,
        startAngle,
        endAngle,
        segments,
        color.ref,
      );

  void drawRingLines(
    Vector2 center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) =>
      native.DrawRingLines(
        center.ref,
        innerRadius,
        outerRadius,
        startAngle,
        endAngle,
        segments,
        color.ref,
      );

  void drawRectangle(int posX, int posY, int width, int height, Color color) =>
      native.DrawRectangle(posX, posY, width, height, color.ref);

  void drawRectangleV(Vector2 position, Vector2 size, Color color) =>
      native.DrawRectangleV(position.ref, size.ref, color.ref);

  void drawRectangleRec(Rectangle rec, Color color) =>
      native.DrawRectangleRec(rec.ref, color.ref);

  void drawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    double rotation,
    Color color,
  ) =>
      native.DrawRectanglePro(rec.ref, origin.ref, rotation, color.ref);

  void drawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    Color color1,
    Color color2,
  ) =>
      native.DrawRectangleGradientV(
        posX,
        posY,
        width,
        height,
        color1.ref,
        color2.ref,
      );

  void drawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
    Color color1,
    Color color2,
  ) =>
      native.DrawRectangleGradientH(
        posX,
        posY,
        width,
        height,
        color1.ref,
        color2.ref,
      );

  void drawRectangleGradientEx(
    Rectangle rec,
    Color col1,
    Color col2,
    Color col3,
    Color col4,
  ) =>
      native.DrawRectangleGradientEx(
        rec.ref,
        col1.ref,
        col2.ref,
        col3.ref,
        col4.ref,
      );

  void drawRectangleLines(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) =>
      native.DrawRectangleLines(posX, posY, width, height, color.ref);

  void drawRectangleLinesEx(Rectangle rec, double lineThick, Color color) =>
      native.DrawRectangleLinesEx(rec.ref, lineThick, color.ref);

  void drawRectangleRounded(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  ) {
    assert(roundness >= 0.0 && roundness <= 1.0);
    native.DrawRectangleRounded(
      rec.ref,
      roundness,
      segments,
      color.ref,
    );
  }

  void drawRectangleRoundedLines(
    Rectangle rec,
    double roundness,
    int segments,
    double lineThick,
    Color color,
  ) {
    assert(roundness >= 0.0 && roundness <= 1.0);
    native.DrawRectangleRoundedLines(
      rec.ref,
      roundness,
      segments,
      lineThick,
      color.ref,
    );
  }

  void drawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color) =>
      native.DrawTriangle(v1.ref, v2.ref, v3.ref, color.ref);

  void drawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color) =>
      native.DrawTriangleLines(v1.ref, v2.ref, v3.ref, color.ref);

  void drawTriangleFan(List<Vector2> points, Color color) {
    return using(
      (arena) => native.DrawTriangleFan(
        vector2ListToPointer(points, allocator: arena),
        points.length,
        color.ref,
      ),
    );
  }

  void drawTriangleStrip(List<Vector2> points, Color color) {
    return using(
      (arena) => native.DrawTriangleStrip(
        vector2ListToPointer(points, allocator: arena),
        points.length,
        color.ref,
      ),
    );
  }

  void drawPoly(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  ) =>
      native.DrawPoly(center.ref, sides, radius, rotation, color.ref);

  void drawPolyLines(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  ) =>
      native.DrawPolyLines(center.ref, sides, radius, rotation, color.ref);

  void drawPolyLinesEx(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    Color color,
  ) =>
      native.DrawPolyLinesEx(
        center.ref,
        sides,
        radius,
        rotation,
        lineThick,
        color.ref,
      );
}
