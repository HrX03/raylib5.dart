part of '../../raylib.dart';

mixin _ModelsMaterialLoadingModule on _RayLibBase {
  List<Material> loadMaterials(String fileName) {
    return using((arena) {
      final materialCountP = arena<Int>();
      final materialsP = native.LoadMaterials(
        fileName.toNativeUtf8(allocator: arena).cast(),
        materialCountP,
      );

      final List<Material> materials = [];
      for (int i = 0; i < materialCountP.value; i++) {
        materials.add(Material.fromRef(materialsP[i]));
      }

      return materials;
    });
  }

  Material loadMaterialDefault() =>
      Material.fromRef(native.LoadMaterialDefault());

  bool isMaterialReady(Material material) =>
      native.IsMaterialReady(material.ref);

  void unloadMaterial(Material material) => native.UnloadMaterial(material.ref);

  void setMaterialTexture(Material material, int mapType, Texture2D texture) =>
      native.SetMaterialTexture(material.getPointer(), mapType, texture.ref);

  void setModelMeshMaterial(Model model, int meshId, int materialId) =>
      native.SetModelMeshMaterial(model.getPointer(), meshId, materialId);
}
