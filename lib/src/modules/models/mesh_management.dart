part of '../../raylib.dart';

mixin _ModelsMeshManagementModule on _RayLibBase {
  void uploadMesh(Mesh mesh, bool dynamic) =>
      native.UploadMesh(mesh.getPointer(), dynamic);

  void updateMeshBuffer(
    Mesh mesh,
    int index,
    Uint8List data,
    int offset,
  ) {
    return using(
      (arena) => native.UpdateMeshBuffer(
        mesh.ref,
        index,
        byteListToUintPointer(data, allocator: arena).cast(),
        data.length,
        offset,
      ),
    );
  }

  void unloadMesh(Mesh mesh) => native.UnloadMesh(mesh.ref);

  void drawMesh(Mesh mesh, Material material, Matrix transform) =>
      native.DrawMesh(mesh.ref, material.ref, transform.ref);

  void drawMeshInstanced(
    Mesh mesh,
    Material material,
    List<Matrix> transforms,
    int instances,
  ) {
    return using(
      (arena) => native.DrawMeshInstanced(
        mesh.ref,
        material.ref,
        transformsListToPointer(transforms, allocator: arena),
        instances,
      ),
    );
  }

  bool exportMesh(Mesh mesh, String fileName) {
    return using(
      (arena) => native.ExportMesh(
        mesh.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  BoundingBox getMeshBoundingBox(Mesh mesh) =>
      BoundingBox.fromRef(native.GetMeshBoundingBox(mesh.ref));

  void genMeshTangents(Mesh mesh) => native.GenMeshTangents(mesh.getPointer());
}
