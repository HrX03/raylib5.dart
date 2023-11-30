import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class BoneInfo extends NativeClass<raylib.BoneInfo> {
  BoneInfo.fromRef(super.ref) : super.fromRef();

  String get name {
    final List<int> codepoints = [];
    for (int i = 0; i < 32; i++) {
      if (ref.name[i] == 0) break;
      codepoints.add(ref.name[i]);
    }

    return String.fromCharCodes(codepoints);
  }

  int get parent => ref.parent;
}
