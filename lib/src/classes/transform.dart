import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/types.dart';

class Transform extends NativeClass<raylib.Transform> {
  Transform.fromRef(super.ref) : super.fromRef();

  Vector3 get translation => Vector3.fromRef(ref.translation);
  Quaternion get rotation => Quaternion.fromRef(ref.rotation);
  Vector3 get scale => Vector3.fromRef(ref.scale);
}
