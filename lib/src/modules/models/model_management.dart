part of '../../raylib.dart';

mixin _ModelsModelManagementModule on _RayLibBase {
  Model loadModel(String fileName) {
    return using(
      (arena) => Model.fromRef(
        native.LoadModel(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Model loadModelFromMesh(Mesh mesh) =>
      Model.fromRef(native.LoadModelFromMesh(mesh.ref));

  bool isModelReady(Model model) => native.IsModelReady(model.ref);

  void unloadModel(Model model) => native.UnloadModel(model.ref);

  BoundingBox getModelBoundingBox(Model model) =>
      BoundingBox.fromRef(native.GetModelBoundingBox(model.ref));
}
