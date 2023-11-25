part of '../../raylib.dart';

mixin _CoreEncodingModule on _RayLibBase {
  Uint8List compressData(Uint8List data) {
    return using((arena) {
      final dataP = byteListToUintPointer(data, allocator: arena);
      final compDataSizeP = arena<Int>();
      final result =
          native.CompressData(dataP.cast(), data.length, compDataSizeP);
      final compressedData =
          uintPointerToByteList(result.cast(), compDataSizeP.value);
      native.MemFree(result.cast());

      return compressedData;
    });
  }

  Uint8List decompressData(Uint8List compData) {
    return using((arena) {
      final compDataP = byteListToUintPointer(compData, allocator: arena);
      final dataSizeP = arena<Int>();
      final result =
          native.DecompressData(compDataP.cast(), compData.length, dataSizeP);
      final decompressedData =
          uintPointerToByteList(result.cast(), dataSizeP.value);
      native.MemFree(result.cast());

      return decompressedData;
    });
  }

  Uint8List encodeDataBase64(Uint8List data) {
    return using((arena) {
      final dataP = byteListToUintPointer(data, allocator: arena);
      final outputSizeP = calloc<Int>();
      final result =
          native.EncodeDataBase64(dataP.cast(), data.length, outputSizeP);
      final encodedData =
          uintPointerToByteList(result.cast(), outputSizeP.value);
      native.MemFree(result.cast());

      return encodedData;
    });
  }

  Uint8List decodeDataBase64(Uint8List data) {
    return using((arena) {
      final dataP = byteListToUintPointer(
        data,
        allocator: arena,
        nullTerminate: true,
      );
      final outputSizeP = calloc<Int>();
      final result = native.DecodeDataBase64(dataP.cast(), outputSizeP);
      final decodedData =
          uintPointerToByteList(result.cast(), outputSizeP.value);
      native.MemFree(result.cast());

      return decodedData;
    });
  }
}
