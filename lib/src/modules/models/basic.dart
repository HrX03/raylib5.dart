part of '../../raylib.dart';

mixin _ModelsBasicModule on _RayLibBase {
  void drawLine3D(Vector3 startPos, Vector3 endPos, Color color) =>
      native.DrawLine3D(startPos.ref, endPos.ref, color.ref);

  void drawPoint3D(Vector3 position, Color color) =>
      native.DrawPoint3D(position.ref, color.ref);

  void drawCircle3D(
    Vector3 center,
    double radius,
    Vector3 rotationAxis,
    double rotationAngle,
    Color color,
  ) =>
      native.DrawCircle3D(
        center.ref,
        radius,
        rotationAxis.ref,
        rotationAngle,
        color.ref,
      );

  void drawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color) =>
      native.DrawTriangle3D(v1.ref, v2.ref, v3.ref, color.ref);

  void drawTriangleStrip3D(List<Vector3> points, int pointCount, Color color) {
    return using(
      (arena) => native.DrawTriangleStrip3D(
        vector3ListToPointer(points, allocator: arena),
        pointCount,
        color.ref,
      ),
    );
  }

  void drawCube(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  ) =>
      native.DrawCube(position.ref, width, height, length, color.ref);

  void drawCubeV(Vector3 position, Vector3 size, Color color) =>
      native.DrawCubeV(position.ref, size.ref, color.ref);

  void drawCubeWires(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  ) =>
      native.DrawCubeWires(position.ref, width, height, length, color.ref);

  void drawCubeWiresV(Vector3 position, Vector3 size, Color color) =>
      native.DrawCubeWiresV(position.ref, size.ref, color.ref);

  void drawSphere(Vector3 centerPos, double radius, Color color) =>
      native.DrawSphere(centerPos.ref, radius, color.ref);

  void drawSphereEx(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  ) =>
      native.DrawSphereEx(centerPos.ref, radius, rings, slices, color.ref);

  void drawSphereWires(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  ) =>
      native.DrawSphereWires(centerPos.ref, radius, rings, slices, color.ref);

  void drawCylinder(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  ) =>
      native.DrawCylinder(
        position.ref,
        radiusTop,
        radiusBottom,
        height,
        slices,
        color.ref,
      );

  void drawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  ) =>
      native.DrawCylinderEx(
        startPos.ref,
        endPos.ref,
        startRadius,
        endRadius,
        sides,
        color.ref,
      );

  void drawCylinderWires(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  ) =>
      native.DrawCylinderWires(
        position.ref,
        radiusTop,
        radiusBottom,
        height,
        slices,
        color.ref,
      );

  void drawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  ) =>
      native.DrawCylinderWiresEx(
        startPos.ref,
        endPos.ref,
        startRadius,
        endRadius,
        sides,
        color.ref,
      );

  void drawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  ) =>
      native.DrawCapsule(
        startPos.ref,
        endPos.ref,
        radius,
        slices,
        rings,
        color.ref,
      );

  void drawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  ) =>
      native.DrawCapsuleWires(
        startPos.ref,
        endPos.ref,
        radius,
        slices,
        rings,
        color.ref,
      );

  void drawPlane(Vector3 centerPos, Vector2 size, Color color) =>
      native.DrawPlane(centerPos.ref, size.ref, color.ref);

  void drawRay(Ray ray, Color color) => native.DrawRay(ray.ref, color.ref);

  void drawGrid(int slices, double spacing) => native.DrawGrid(slices, spacing);
}
