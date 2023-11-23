import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/classes/matrix.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/utils/utils.dart';

typedef MatrixArray2 = (Matrix, Matrix);
typedef DoubleArray2 = (double, double);

class VrStereoConfig extends NativeClass<raylib.VrStereoConfig> {
  VrStereoConfig({
    required MatrixArray2 projection,
    required MatrixArray2 viewOffset,
    required DoubleArray2 leftLensCenter,
    required DoubleArray2 rightLensCenter,
    required DoubleArray2 leftScreenCenter,
    required DoubleArray2 rightScreenCenter,
    required DoubleArray2 scale,
    required DoubleArray2 scaleIn,
  }) {
    pointer = calloc<raylib.VrStereoConfig>();
    ref = pointer!.ref;
    ref.projection.push(projection);
    ref.viewOffset.push(viewOffset);
    ref.leftLensCenter.push(leftLensCenter);
    ref.rightLensCenter.push(rightLensCenter);
    ref.leftScreenCenter.push(leftScreenCenter);
    ref.rightScreenCenter.push(rightScreenCenter);
    ref.scale.push(scale);
    ref.scaleIn.push(scaleIn);
  }

  VrStereoConfig.fromRef(super.ref) : super.fromRef();

  MatrixArray2 get projection => (
        Matrix.fromRef(ref.projection[0]),
        Matrix.fromRef(ref.projection[1]),
      );

  MatrixArray2 get viewOffset => (
        Matrix.fromRef(ref.viewOffset[0]),
        Matrix.fromRef(ref.viewOffset[1]),
      );

  DoubleArray2 get leftLensCenter =>
      (ref.leftLensCenter[0], ref.leftLensCenter[1]);

  DoubleArray2 get rightLensCenter =>
      (ref.rightLensCenter[0], ref.rightLensCenter[1]);

  DoubleArray2 get leftScreenCenter =>
      (ref.leftScreenCenter[0], ref.leftScreenCenter[1]);

  DoubleArray2 get rightScreenCenter =>
      (ref.rightScreenCenter[0], ref.rightScreenCenter[1]);

  DoubleArray2 get scale => (ref.scale[0], ref.scale[1]);

  DoubleArray2 get scaleIn => (ref.scaleIn[0], ref.scaleIn[1]);
}
