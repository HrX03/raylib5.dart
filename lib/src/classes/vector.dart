import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class NVector2<T extends num> extends NativeClass<raylib.Vector2> {
  NVector2(T x, T y) {
    pointer = calloc<raylib.Vector2>();
    ref = pointer!.ref;
    this.x = x;
    this.y = y;
  }

  NVector2.fromRef(super.ref) : super.fromRef();
  NVector2.zero() : this(0.0 as T, 0.0 as T);

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

class Vector2 extends NVector2<double> {
  Vector2(super.x, super.y);
  Vector2.fromRef(super.ref) : super.fromRef();
  Vector2.zero() : super(0.0, 0.0);
}

class Vector3 extends NVector3<double> {
  Vector3(super.x, super.y, super.z);
  Vector3.fromRef(super.ref) : super.fromRef();
  Vector3.zero() : super(0.0, 0.0, 0.0);
}

class Vector4 extends NVector4<double> {
  Vector4(super.x, super.y, super.z, super.w);
  Vector4.fromRef(super.ref) : super.fromRef();
  Vector4.zero() : super(0.0, 0.0, 0.0, 0.0);
}

class IVector2 extends NVector2<int> {
  IVector2(super.x, super.y);
  IVector2.fromRef(super.ref) : super.fromRef();
  IVector2.zero() : super(0, 0);
}

class IVector3 extends NVector3<int> {
  IVector3(super.x, super.y, super.z);
  IVector3.fromRef(super.ref) : super.fromRef();
  IVector3.zero() : super(0, 0, 0);
}

class IVector4 extends NVector4<int> {
  IVector4(super.x, super.y, super.z, super.w);
  IVector4.fromRef(super.ref) : super.fromRef();
  IVector4.zero() : super(0, 0, 0, 0);
}

extension on num {
  T convertTo<T extends num>() {
    return switch (T) {
      const (int) => toInt(),
      const (double) => toDouble(),
      _ => throw UnimplementedError(),
    } as T;
  }
}
