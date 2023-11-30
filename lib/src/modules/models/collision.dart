part of '../../raylib.dart';

mixin _ModelsCollisionModule on _RayLibBase {
  bool checkCollisionSpheres(
    Vector3 center1,
    double radius1,
    Vector3 center2,
    double radius2,
  ) =>
      native.CheckCollisionSpheres(center1.ref, radius1, center2.ref, radius2);

  bool checkCollisionBoxes(BoundingBox box1, BoundingBox box2) =>
      native.CheckCollisionBoxes(box1.ref, box2.ref);

  bool checkCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    double radius,
  ) =>
      native.CheckCollisionBoxSphere(box.ref, center.ref, radius);

  RayCollision getRayCollisionSphere(Ray ray, Vector3 center, double radius) =>
      RayCollision.fromRef(
        native.GetRayCollisionSphere(ray.ref, center.ref, radius),
      );

  RayCollision getRayCollisionBox(Ray ray, BoundingBox box) =>
      RayCollision.fromRef(native.GetRayCollisionBox(ray.ref, box.ref));

  RayCollision getRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform) =>
      RayCollision.fromRef(
        native.GetRayCollisionMesh(ray.ref, mesh.ref, transform.ref),
      );

  RayCollision getRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  ) =>
      RayCollision.fromRef(
        native.GetRayCollisionTriangle(ray.ref, p1.ref, p2.ref, p3.ref),
      );

  RayCollision getRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  ) =>
      RayCollision.fromRef(
        native.GetRayCollisionQuad(ray.ref, p1.ref, p2.ref, p3.ref, p4.ref),
      );
}
