part of '../../raylib.dart';

mixin _ShapesSplineEvalModule on _RayLibBase {
  Vector2 getSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    double t,
  ) =>
      Vector2.fromRef(
        _native.GetSplinePointLinear(startPos.ref, endPos.ref, t),
      );

  Vector2 getSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  ) =>
      Vector2.fromRef(
        _native.GetSplinePointBasis(p1.ref, p2.ref, p3.ref, p4.ref, t),
      );

  Vector2 getSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  ) =>
      Vector2.fromRef(
        _native.GetSplinePointCatmullRom(p1.ref, p2.ref, p3.ref, p4.ref, t),
      );

  Vector2 getSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double t,
  ) =>
      Vector2.fromRef(
        _native.GetSplinePointBezierQuad(p1.ref, c2.ref, p3.ref, t),
      );

  Vector2 getSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double t,
  ) =>
      Vector2.fromRef(
        _native.GetSplinePointBezierCubic(p1.ref, c2.ref, c3.ref, p4.ref, t),
      );
}
