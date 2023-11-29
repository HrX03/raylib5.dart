import 'dart:ffi';
import 'dart:typed_data';

import 'package:raylib/raylib.dart';

typedef Array2<T> = (T, T);
typedef Array4<T> = (T, T, T, T);

typedef TraceLogCallback = void Function(
  int logLevel,
  String text,
  String args,
);

typedef LoadFileDataCallback = Uint8List Function(
  String fileName,
  int dataSize,
);

typedef SaveFileDataCallback = bool Function(
  String fileName,
  Uint8List data,
  int dataSize,
);

typedef LoadFileTextCallback = String Function(String fileName);
typedef SaveFileTextCallback = bool Function(String fileName, String text);

typedef AudioCallback = void Function(Int16List bufferData);
typedef FloatAudioCallback = Float32List Function(Float32List bufferData);

typedef LineCollisionResult = (bool collided, Vector2 collisionPoint);
typedef ImageSequence = (Image img, int frameCount);

typedef AudioProcessorToken
    = CallbackToken<Void Function(Pointer<Void>, UnsignedInt)>;
