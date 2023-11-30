import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class RayCollision extends NativeClass<raylib.RayCollision> {
  RayCollision.fromRef(super.ref) : super.fromRef();

  double get distance => ref.distance;
  bool get hit => ref.hit;
  Vector3 get normal => Vector3.fromRef(ref.normal);
  Vector3 get point => Vector3.fromRef(ref.point);
}
