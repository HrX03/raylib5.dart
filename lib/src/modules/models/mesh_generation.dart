part of '../../raylib.dart';

mixin _ModelsMeshGenerationModule on _RayLibBase {
  Mesh genMeshPoly(int sides, double radius) =>
      Mesh.fromRef(native.GenMeshPoly(sides, radius));

  Mesh genMeshPlane(double width, double length, int resX, int resZ) =>
      Mesh.fromRef(native.GenMeshPlane(width, length, resX, resZ));

  Mesh genMeshCube(double width, double height, double length) =>
      Mesh.fromRef(native.GenMeshCube(width, length, length));

  Mesh genMeshSphere(double radius, int rings, int slices) =>
      Mesh.fromRef(native.GenMeshSphere(radius, rings, slices));

  Mesh genMeshHemiSphere(double radius, int rings, int slices) =>
      Mesh.fromRef(native.GenMeshHemiSphere(radius, rings, slices));

  Mesh genMeshCylinder(double radius, double height, int slices) =>
      Mesh.fromRef(native.GenMeshCylinder(radius, height, slices));

  Mesh genMeshCone(double radius, double height, int slices) =>
      Mesh.fromRef(native.GenMeshCone(radius, height, slices));

  Mesh genMeshTorus(double radius, double size, int radSeg, int sides) =>
      Mesh.fromRef(native.GenMeshTorus(radius, size, radSeg, sides));

  Mesh genMeshKnot(double radius, double size, int radSeg, int sides) =>
      Mesh.fromRef(native.GenMeshKnot(radius, size, radSeg, sides));

  Mesh genMeshHeightmap(Image heightmap, Vector3 size) =>
      Mesh.fromRef(native.GenMeshHeightmap(heightmap.ref, size.ref));

  Mesh genMeshCubicmap(Image cubicmap, Vector3 cubeSize) =>
      Mesh.fromRef(native.GenMeshCubicmap(cubicmap.ref, cubeSize.ref));
}
