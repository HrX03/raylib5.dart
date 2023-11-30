import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class BoundingBox extends NativeClass<raylib.BoundingBox> {
  BoundingBox.fromRef(super.ref) : super.fromRef();

  Vector3 get min => Vector3.fromRef(ref.min);
  Vector3 get max => Vector3.fromRef(ref.max);
}
