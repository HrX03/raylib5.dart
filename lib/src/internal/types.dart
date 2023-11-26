import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

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
