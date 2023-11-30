import 'package:raylib/src/classes/bone_info.dart';
import 'package:raylib/src/classes/transform.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class ModelAnimation extends NativeClass<raylib.ModelAnimation>
    with Unloadable {
  ModelAnimation.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadModelAnimation(ref);

  int get boneCount => ref.boneCount;
  int get frameCount => ref.frameCount;

  List<BoneInfo> getBones() {
    final List<BoneInfo> data = [];
    for (int i = 0; i < boneCount; i++) {
      data.add(BoneInfo.fromRef(ref.bones[i]));
    }

    return data;
  }

  List<List<Transform>> getFramePoses() {
    final List<List<Transform>> data = [];
    for (int i = 0; i < frameCount; i++) {
      final pointer = ref.framePoses[i];
      final poses = <Transform>[];
      for (int j = 0; j < boneCount; j++) {
        poses.add(Transform.fromRef(pointer[j]));
      }
      data.add(poses);
    }

    return data;
  }

  String get name {
    final List<int> codepoints = [];
    for (int i = 0; i < 32; i++) {
      if (ref.name[i] == 0) break;
      codepoints.add(ref.name[i]);
    }

    return String.fromCharCodes(codepoints);
  }
}
