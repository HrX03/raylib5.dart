import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Ray extends NativeClass<raylib.Ray> {
  Ray.fromRef(super.ref) : super.fromRef();

  Vector3 get direction => Vector3.fromRef(ref.direction);
  Vector3 get position => Vector3.fromRef(ref.position);
}
