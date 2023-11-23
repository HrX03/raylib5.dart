import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class NVector2<T extends num> extends NativeClass<raylib.Vector2> {
  NVector2(T x, T y) {
    pointer = calloc<raylib.Vector2>();
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
  }

  NVector2.fromRef(super.ref) : super.fromRef();
  NVector2.zero() : this(0 as T, 0 as T);

  T get x => ref.x.convertTo<T>();
  T get y => ref.y.convertTo<T>();

  set x(T x) => ref.x = x.toDouble();
  set y(T y) => ref.y = y.toDouble();
}

class NVector3<T extends num> extends NativeClass<raylib.Vector3> {
  NVector3(T x, T y, T z) {
    pointer = calloc<raylib.Vector3>();
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  NVector3.fromRef(super.ref) : super.fromRef();
  NVector3.zero() : this(0 as T, 0 as T, 0 as T);

  T get x => ref.x.convertTo<T>();
  T get y => ref.y.convertTo<T>();
  T get z => ref.z.convertTo<T>();

  set x(T x) => ref.x = x.toDouble();
  set y(T y) => ref.y = y.toDouble();
  set z(T z) => ref.z = z.toDouble();
}

class NVector4<T extends num> extends NativeClass<raylib.Vector4> {
  NVector4(T x, T y, T z, T w) {
    pointer = calloc<raylib.Vector4>();
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
  }

  NVector4.fromRef(super.ref) : super.fromRef();
  NVector4.zero() : this(0 as T, 0 as T, 0 as T, 0 as T);

  T get x => ref.x.convertTo<T>();
  T get y => ref.y.convertTo<T>();
  T get z => ref.z.convertTo<T>();
  T get w => ref.w.convertTo<T>();

  set x(T x) => ref.x = x.toDouble();
  set y(T y) => ref.y = y.toDouble();
  set z(T z) => ref.z = z.toDouble();
  set w(T w) => ref.w = w.toDouble();
}

typedef Vector2 = NVector2<double>;
typedef Vector3 = NVector3<double>;
typedef Vector4 = NVector4<double>;

typedef IVector2 = NVector2<int>;
typedef IVector3 = NVector3<int>;
typedef IVector4 = NVector4<int>;

extension on num {
  T convertTo<T extends num>() {
    return switch (T) {
      const (int) => toInt(),
      const (double) => toDouble(),
      _ => throw UnimplementedError(),
    } as T;
  }
}
