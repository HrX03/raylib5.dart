import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:raylib/src/classes/glyph_info.dart';
import 'package:raylib/src/classes/image.dart';
import 'package:raylib/src/classes/matrix.dart';
import 'package:raylib/src/classes/rectangle.dart';
import 'package:raylib/src/classes/vector.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/types.dart';

Pointer<raylib.Image> imageListToPointer(
  List<Image> data, {
  Allocator allocator = calloc,
}) {
  final cArray = allocator<raylib.Image>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<raylib.GlyphInfo> glyphInfoListToPointer(
  List<GlyphInfo> data, {
  Allocator allocator = calloc,
}) {
  final cArray = allocator<raylib.GlyphInfo>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<raylib.Rectangle> rectangleListToPointer(
  List<Rectangle> data, {
  Allocator allocator = calloc,
}) {
  final cArray = allocator<raylib.Rectangle>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<raylib.Vector2> vector2ListToPointer(
  List<Vector2> data, {
  Allocator allocator = calloc,
}) {
  final cArray = allocator<raylib.Vector2>(data.length);
  for (var i = 0; i < data.length; i++) {
    cArray[i] = data[i].ref;
  }

  return cArray;
}

Pointer<Uint8> byteListToUintPointer(
  Uint8List data, {
  bool nullTerminate = false,
  Allocator allocator = calloc,
}) {
  final size = data.length + (nullTerminate ? 1 : 0);
  final pointer = allocator<Uint8>(size);

  for (int i = 0; i < data.length; i++) {
    pointer[i] = data[i];
  }

  return pointer;
}

Uint8List uintPointerToByteList(Pointer<Uint8> pointer, int size) {
  final data = Uint8List(size);
  for (int i = 0; i < data.length; i++) {
    data[i] = pointer[i];
  }

  return data;
}

Int16List shortPointerToByte16List(Pointer<Short> pointer, int size) {
  final data = Int16List(size);
  for (int i = 0; i < data.length; i++) {
    data[i] = pointer[i];
  }

  return data;
}

Float32List floatPointerToFloat32List(Pointer<Float> pointer, int size) {
  final data = Float32List(size);
  for (int i = 0; i < data.length; i++) {
    data[i] = pointer[i];
  }

  return data;
}

Pointer<Int> codepointsToPointer(
  List<int>? codepoints, {
  Allocator allocator = calloc,
}) {
  if (codepoints == null) return nullptr;

  final pointer = allocator<Int>(codepoints.length);

  for (int i = 0; i < codepoints.length; i++) {
    pointer[i] = codepoints[i];
  }

  return pointer;
}

List<double> pointerToSamples(Pointer<Float> pointer, int size) {
  final data = List<double>.filled(size, 0.0);
  for (int i = 0; i < data.length; i++) {
    data[i] = pointer[i];
  }

  return data;
}

extension MatrixArrayCopy2 on Array<raylib.Matrix> {
  void push(Array2<Matrix> pair) {
    for (int i = 0; i < 2; i++) {
      this[i].m0 = pair[i].m0;
      this[i].m1 = pair[i].m1;
      this[i].m2 = pair[i].m2;
      this[i].m3 = pair[i].m3;
      this[i].m4 = pair[i].m4;
      this[i].m5 = pair[i].m5;
      this[i].m6 = pair[i].m6;
      this[i].m7 = pair[i].m7;
      this[i].m8 = pair[i].m8;
      this[i].m9 = pair[i].m9;
      this[i].m10 = pair[i].m10;
      this[i].m11 = pair[i].m11;
      this[i].m12 = pair[i].m12;
    }
  }
}

extension FloatArrayCopy on Array<Float> {
  void push2(Array2<double> pair) {
    this[0] = pair.$1;
    this[1] = pair.$2;
  }

  void push4(Array4<double> quad) {
    this[0] = quad.$1;
    this[1] = quad.$2;
    this[2] = quad.$3;
    this[3] = quad.$4;
  }
}

extension IntArrayCopy on Array<Int32> {
  void push4(Array4<int> quad) {
    this[0] = quad.$1;
    this[1] = quad.$2;
    this[2] = quad.$3;
    this[3] = quad.$4;
  }
}

extension RecordIndexAccess2<T> on (T, T) {
  T operator [](int index) {
    return switch (index) {
      0 => $1,
      1 => $2,
      _ => throw ArgumentError.value(index),
    };
  }
}

extension TraceLogCallbackWrapper on TraceLogCallback {
  void Function(int, Pointer<Char>, Pointer<Char>) wrap() {
    return (int logLevel, Pointer<Char> text, Pointer<Char> args) {
      final textStr = text.cast<Utf8>().toDartString();
      final argsStr = args.cast<Utf8>().toDartString();

      return this(logLevel, textStr, argsStr);
    };
  }
}

extension LoadFileDataCallbackWrapper on LoadFileDataCallback {
  Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>) wrap() {
    return (Pointer<Char> fileName, Pointer<Int> dataSize) {
      final fileNameStr = fileName.cast<Utf8>().toDartString();
      final rData = this(fileNameStr, dataSize.value);
      dataSize.value = rData.length;

      final pointer = calloc<UnsignedChar>(rData.length);

      for (int i = 0; i < rData.length; i++) {
        pointer[i] = rData[i];
      }

      return pointer;
    };
  }
}

extension SaveFileDataCallbackWrapper on SaveFileDataCallback {
  bool Function(Pointer<Char>, Pointer<Void>, int) wrap() {
    return (Pointer<Char> fileName, Pointer<Void> data, int dataSize) {
      final fileNameStr = fileName.cast<Utf8>().toDartString();
      final dataBytes = data.cast<Uint8>().asTypedList(dataSize);

      return this(fileNameStr, dataBytes, dataSize);
    };
  }
}

extension LoadFileTextCallbackWrapper on LoadFileTextCallback {
  Pointer<Char> Function(Pointer<Char>) wrap() {
    return (Pointer<Char> fileName) {
      final fileNameStr = fileName.cast<Utf8>().toDartString();
      final response = this(fileNameStr);
      final arena = Arena();

      try {
        return response.toNativeUtf8(allocator: arena).cast();
      } finally {
        arena.releaseAll();
      }
    };
  }
}

extension SaveFileTextCallbackWrapper on SaveFileTextCallback {
  bool Function(Pointer<Char>, Pointer<Char>) wrap() {
    return (Pointer<Char> fileName, Pointer<Char> text) {
      final fileNameStr = fileName.cast<Utf8>().toDartString();
      final textStr = text.cast<Utf8>().toDartString();
      return this(fileNameStr, textStr);
    };
  }
}

extension AudioCallbackWrapper on AudioCallback {
  void Function(Pointer<Void>, int) wrap() {
    return (Pointer<Void> bufferData, int frames) {
      final bufferDataList =
          shortPointerToByte16List(bufferData.cast(), frames);
      return this(bufferDataList);
    };
  }
}

extension FloatAudioCallbackWrapper on FloatAudioCallback {
  void Function(Pointer<Void>, int) wrap() {
    return (Pointer<Void> bufferData, int frames) {
      final bufferDataList =
          floatPointerToFloat32List(bufferData.cast(), frames * 2);
      final result = this(bufferDataList);
      if (result.length != bufferDataList.length) {
        throw Exception(
          "The buffer returned from an audio processor callback must have the same length as the original buffer",
        );
      }

      final bufferP = bufferData.cast<Float>();
      for (int i = 0; i < frames * 2; i++) {
        bufferP[i] = result[i];
      }

      return;
    };
  }
}
