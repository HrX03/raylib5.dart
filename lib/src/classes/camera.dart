import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/enums/camera.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class Camera2D extends NativeClass<raylib.Camera2D> {
  Camera2D({
    Vector2? offset,
    Vector2? target,
    double rotation = 0,
    double zoom = 1,
  }) {
    pointer = calloc<raylib.Camera2D>();
    ref = pointer!.ref;
    this.offset = offset ?? Vector2.zero();
    this.target = target ?? Vector2.zero();
    this.rotation = rotation;
    this.zoom = zoom;
  }

  Camera2D.fromRef(super.ref) : super.fromRef();

  Vector2 get offset => Vector2.fromRef(ref.offset);
  set offset(Vector2 offset) => ref.offset = offset.ref;

  Vector2 get target => Vector2.fromRef(ref.target);
  set target(Vector2 target) => ref.target = target.ref;

  double get rotation => ref.rotation;
  set rotation(double rotation) => ref.rotation = rotation;

  double get zoom => ref.zoom;
  set zoom(double zoom) => ref.zoom = zoom;
}

class Camera3D extends NativeClass<raylib.Camera3D> {
  Camera3D({
    Vector3? position,
    Vector3? target,
    Vector3? up,
    double fovy = 1,
    CameraProjection projection = CameraProjection.perspective,
  }) {
    pointer = calloc<raylib.Camera3D>();
    ref = pointer!.ref;
    this.position = position ?? Vector3.zero();
    this.target = target ?? Vector3.zero();
    this.up = up ?? Vector3.zero();
    this.fovy = fovy;
    this.projection = projection;
  }

  Camera3D.fromRef(super.ref) : super.fromRef();

  Vector3 get position => Vector3.fromRef(ref.position);
  set position(Vector3 position) => ref.position = position.ref;

  Vector3 get target => Vector3.fromRef(ref.target);
  set target(Vector3 target) => ref.target = target.ref;

  Vector3 get up => Vector3.fromRef(ref.up);
  set up(Vector3 up) => ref.up = up.ref;

  double get fovy => ref.fovy;
  set fovy(double fovy) => ref.fovy = fovy;

  CameraProjection get projection => CameraProjection.values[ref.projection];
  set projection(CameraProjection projection) =>
      ref.projection = projection.index;
}

typedef Camera = Camera3D;
