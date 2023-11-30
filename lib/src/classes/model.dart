import 'package:raylib/src/classes/bone_info.dart';
import 'package:raylib/src/classes/material.dart';
import 'package:raylib/src/classes/matrix.dart';
import 'package:raylib/src/classes/mesh.dart';
import 'package:raylib/src/classes/transform.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/types.dart';

class Model extends NativeClass<raylib.Model> with Pointable, Unloadable {
  Model.fromRef(super.ref) : super.fromRef();

  @override
  raylib.Model get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.Model> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.Model>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  @override
  void unload(raylib.RayLibNative native) => native.UnloadModel(ref);

  Matrix get transform => Matrix.fromRef(ref.transform);
  int get meshCount => ref.meshCount;
  int get materialCount => ref.materialCount;

  List<Mesh> getMeshes() {
    final List<Mesh> data = [];
    for (int i = 0; i < meshCount; i++) {
      data.add(Mesh.fromRef(ref.meshes[i]));
    }

    return data;
  }

  List<Material> getMaterials() {
    final List<Material> data = [];
    for (int i = 0; i < materialCount; i++) {
      data.add(Material.fromRef(ref.materials[i]));
    }

    return data;
  }

  PointerList<Int> get meshMaterial => PointerList(ref.meshMaterial);

  int get boneCount => ref.boneCount;

  List<BoneInfo> getBones() {
    final List<BoneInfo> data = [];
    for (int i = 0; i < boneCount; i++) {
      data.add(BoneInfo.fromRef(ref.bones[i]));
    }

    return data;
  }

  List<Transform> getBindPose() {
    final List<Transform> data = [];
    for (int i = 0; i < boneCount; i++) {
      data.add(Transform.fromRef(ref.bindPose[i]));
    }

    return data;
  }
}
