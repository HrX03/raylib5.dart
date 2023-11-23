part of '../../raylib.dart';

mixin _ShapesCollisionModule on _RayLibBase {
  bool checkCollisionRecs(Rectangle rec1, Rectangle rec2) =>
      _native.CheckCollisionRecs(rec1.ref, rec2.ref);

  bool checkCollisionCircles(
    Vector2 center1,
    double radius1,
    Vector2 center2,
    double radius2,
  ) =>
      _native.CheckCollisionCircles(center1.ref, radius1, center2.ref, radius2);

  bool checkCollisionCircleRec(Vector2 center, double radius, Rectangle rec) =>
      _native.CheckCollisionCircleRec(center.ref, radius, rec.ref);

  bool checkCollisionPointRec(Vector2 point, Rectangle rec) =>
      _native.CheckCollisionPointRec(point.ref, rec.ref);

  bool checkCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    double radius,
  ) =>
      _native.CheckCollisionPointCircle(point.ref, center.ref, radius);

  bool checkCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  ) =>
      _native.CheckCollisionPointTriangle(point.ref, p1.ref, p2.ref, p3.ref);

  bool checkCollisionPointPoly(
    Vector2 point,
    List<Vector2> points,
  ) =>
      _native.CheckCollisionPointPoly(
        point.ref,
        vector2ListToPointer(points),
        points.length,
      );

  (bool, Vector2 collisionPoint) checkCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
  ) {
    return using((arena) {
      final collisionPoint = arena<raylib.Vector2>();
      final collided = _native.CheckCollisionLines(
        startPos1.ref,
        endPos1.ref,
        startPos2.ref,
        endPos2.ref,
        collisionPoint,
      );

      return (collided, Vector2.fromRef(collisionPoint.ref));
    });
  }

  bool checkCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    int threshold,
  ) =>
      _native.CheckCollisionPointLine(point.ref, p1.ref, p2.ref, threshold);

  Rectangle getCollisionRec(Rectangle rec1, Rectangle rec2) =>
      Rectangle.fromRef(_native.GetCollisionRec(rec1.ref, rec2.ref));
}
