part of '../../raylib.dart';

mixin _ShapesSplinesModule on _RayLibBase {
  void drawSplineLinear(
    List<Vector2> points,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineLinear(
        vector2ListToPointer(points),
        points.length,
        thick,
        color.ref,
      );

  void drawSplineBasis(
    List<Vector2> points,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineBasis(
        vector2ListToPointer(points),
        points.length,
        thick,
        color.ref,
      );

  void drawSplineCatmullRom(
    List<Vector2> points,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineCatmullRom(
        vector2ListToPointer(points),
        points.length,
        thick,
        color.ref,
      );

  void drawSplineBezierQuadratic(
    List<Vector2> points,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineBezierQuadratic(
        vector2ListToPointer(points),
        points.length,
        thick,
        color.ref,
      );

  void drawSplineBezierCubic(
    List<Vector2> points,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineBezierCubic(
        vector2ListToPointer(points),
        points.length,
        thick,
        color.ref,
      );

  void drawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineSegmentLinear(p1.ref, p2.ref, thick, color.ref);

  void drawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineSegmentBasis(
        p1.ref,
        p2.ref,
        p3.ref,
        p4.ref,
        thick,
        color.ref,
      );

  void drawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineSegmentCatmullRom(
        p1.ref,
        p2.ref,
        p3.ref,
        p4.ref,
        thick,
        color.ref,
      );

  void drawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineSegmentBezierQuadratic(
        p1.ref,
        c2.ref,
        p3.ref,
        thick,
        color.ref,
      );

  void drawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double thick,
    Color color,
  ) =>
      _native.DrawSplineSegmentBezierCubic(
        p1.ref,
        c2.ref,
        c3.ref,
        p4.ref,
        thick,
        color.ref,
      );
}
