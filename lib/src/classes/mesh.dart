import 'package:raylib/src/classes/color.dart';
import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/internal/pointer_list.dart';

class Mesh extends NativeClass<raylib.Mesh> with Pointable, Unloadable {
  Mesh.fromRef(super.ref) : super.fromRef();

  @override
  raylib.Mesh get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.Mesh> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.Mesh>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  @override
  void unload(raylib.RayLibNative native) => native.UnloadMesh(ref);

  int get vertexCount => ref.vertexCount;
  int get triangleCount => ref.triangleCount;

  List<Vector3> getVertices() {
    final List<Vector3> data = [];
    for (int i = 0; i < vertexCount * 3; i += 3) {
      data.add(
        Vector3(ref.vertices[i], ref.vertices[i + 1], ref.vertices[i + 2]),
      );
    }

    return data;
  }

  List<Vector2> getTexcoords() {
    final List<Vector2> data = [];
    for (int i = 0; i < vertexCount * 2; i += 2) {
      data.add(Vector2(ref.texcoords[i], ref.texcoords[i + 1]));
    }

    return data;
  }

  List<Vector2> getTexcoords2() {
    final List<Vector2> data = [];
    for (int i = 0; i < vertexCount * 2; i += 2) {
      data.add(Vector2(ref.texcoords2[i], ref.texcoords2[i + 1]));
    }

    return data;
  }

  List<Vector3> getNormals() {
    final List<Vector3> data = [];
    for (int i = 0; i < vertexCount * 3; i += 3) {
      data.add(Vector3(ref.normals[i], ref.normals[i + 1], ref.normals[i + 2]));
    }

    return data;
  }

  List<Vector4> getTangents() {
    final List<Vector4> data = [];
    for (int i = 0; i < vertexCount * 4; i += 4) {
      data.add(
        Vector4(
          ref.tangents[i],
          ref.tangents[i + 1],
          ref.tangents[i + 2],
          ref.tangents[i + 3],
        ),
      );
    }

    return data;
  }

  List<Color> getColors() {
    final List<Color> data = [];
    for (int i = 0; i < vertexCount * 4; i += 4) {
      data.add(
        Color(
          ref.colors[i],
          ref.colors[i + 1],
          ref.colors[i + 2],
          ref.colors[i + 3],
        ),
      );
    }

    return data;
  }

  PointerList<Int16> get indices => PointerList(ref.indices.cast());

  PointerList<Float> get animVertices => PointerList(ref.animVertices);
  PointerList<Float> get animNormals => PointerList(ref.animNormals);
  PointerList<Int> get boneIds => PointerList(ref.boneIds.cast());
  PointerList<Float> get boneWeights => PointerList(ref.boneWeights);

  int get vaoId => ref.vaoId;
  PointerList<Int> get vboId => PointerList(ref.vboId.cast());
}
