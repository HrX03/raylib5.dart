import 'package:raylib/src/classes/matrix.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/internal/utils.dart';
import 'package:raylib/src/types.dart';

class VrStereoConfig extends NativeClass<raylib.VrStereoConfig>
    with Unloadable {
  VrStereoConfig({
    required Array2<Matrix> projection,
    required Array2<Matrix> viewOffset,
    required Array2<double> leftLensCenter,
    required Array2<double> rightLensCenter,
    required Array2<double> leftScreenCenter,
    required Array2<double> rightScreenCenter,
    required Array2<double> scale,
    required Array2<double> scaleIn,
  }) {
    pointer = calloc<raylib.VrStereoConfig>();
    ref = pointer!.ref;
    ref.projection.push(projection);
    ref.viewOffset.push(viewOffset);
    ref.leftLensCenter.push2(leftLensCenter);
    ref.rightLensCenter.push2(rightLensCenter);
    ref.leftScreenCenter.push2(leftScreenCenter);
    ref.rightScreenCenter.push2(rightScreenCenter);
    ref.scale.push2(scale);
    ref.scaleIn.push2(scaleIn);
  }

  VrStereoConfig.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadVrStereoConfig(ref);

  Array2<Matrix> get projection => (
        Matrix.fromRef(ref.projection[0]),
        Matrix.fromRef(ref.projection[1]),
      );

  Array2<Matrix> get viewOffset => (
        Matrix.fromRef(ref.viewOffset[0]),
        Matrix.fromRef(ref.viewOffset[1]),
      );

  Array2<double> get leftLensCenter =>
      (ref.leftLensCenter[0], ref.leftLensCenter[1]);

  Array2<double> get rightLensCenter =>
      (ref.rightLensCenter[0], ref.rightLensCenter[1]);

  Array2<double> get leftScreenCenter =>
      (ref.leftScreenCenter[0], ref.leftScreenCenter[1]);

  Array2<double> get rightScreenCenter =>
      (ref.rightScreenCenter[0], ref.rightScreenCenter[1]);

  Array2<double> get scale => (ref.scale[0], ref.scale[1]);

  Array2<double> get scaleIn => (ref.scaleIn[0], ref.scaleIn[1]);
}

class VrDeviceInfo extends NativeClass<raylib.VrDeviceInfo> {
  VrDeviceInfo({
    required int hResolution,
    required int vResolution,
    required double hScreenSize,
    required double vScreenSize,
    required double vScreenCenter,
    required double eyeToScreenDistance,
    required double lensSeparationDistance,
    required double interpupillaryDistance,
    required Array4<double> lensDistortionValues,
    required Array4<double> chromaAbCorrection,
  }) {
    pointer = calloc<raylib.VrDeviceInfo>();
    ref = pointer!.ref;
    ref.hResolution = hResolution;
    ref.vResolution = vResolution;
    ref.hScreenSize = hScreenSize;
    ref.vScreenSize = vScreenSize;
    ref.vScreenCenter = vScreenCenter;
    ref.eyeToScreenDistance = eyeToScreenDistance;
    ref.lensSeparationDistance = lensSeparationDistance;
    ref.interpupillaryDistance = interpupillaryDistance;
    ref.lensDistortionValues.push4(lensDistortionValues);
    ref.chromaAbCorrection.push4(chromaAbCorrection);
  }

  VrDeviceInfo.fromRef(super.ref) : super.fromRef();

  int get hResolution => ref.hResolution;

  int get vResolution => ref.vResolution;

  double get hScreenSize => ref.hScreenSize;

  double get vScreenSize => ref.vScreenSize;

  double get vScreenCenter => ref.vScreenCenter;

  double get eyeToScreenDistance => ref.eyeToScreenDistance;

  double get lensSeparationDistance => ref.lensSeparationDistance;

  double get interpupillaryDistance => ref.interpupillaryDistance;

  Array4<double> get lensDistortionValues => (
        ref.lensDistortionValues[0],
        ref.lensDistortionValues[1],
        ref.lensDistortionValues[2],
        ref.lensDistortionValues[3],
      );

  Array4<double> get chromaAbCorrection => (
        ref.chromaAbCorrection[0],
        ref.chromaAbCorrection[1],
        ref.chromaAbCorrection[2],
        ref.chromaAbCorrection[3],
      );
}
