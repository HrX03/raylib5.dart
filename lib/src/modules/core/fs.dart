part of '../../raylib.dart';

mixin _CoreFsModule on _RayLibBase {
  Uint8List loadFileData(String fileName) {
    return using((arena) {
      final dataSizeP = arena<Int>();
      final dataP = native.LoadFileData(
        fileName.toNativeUtf8(allocator: arena).cast<Char>(),
        dataSizeP,
      );

      try {
        return uintPointerToByteList(dataP.cast(), dataSizeP.value);
      } finally {
        native.UnloadFileData(dataP);
      }
    });
  }

  bool saveFileData(String fileName, Uint8List data) {
    return using(
      (arena) => native.SaveFileData(
        fileName.toNativeUtf8(allocator: arena).cast(),
        byteListToUintPointer(data, allocator: arena).cast(),
        data.length,
      ),
    );
  }

  bool exportDataAsCode(String fileName, Uint8List data) {
    return using(
      (arena) => native.ExportDataAsCode(
        byteListToUintPointer(data, allocator: arena).cast().cast(),
        data.length,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  String loadFileText(String fileName) {
    return using((arena) {
      final dataP = native.LoadFileText(
        fileName.toNativeUtf8(allocator: arena).cast<Char>(),
      );

      try {
        return dataP.cast<Utf8>().toDartString();
      } finally {
        native.UnloadFileText(dataP);
      }
    });
  }

  bool saveFileText(String fileName, String text) {
    return using(
      (arena) => native.SaveFileText(
        fileName.toNativeUtf8(allocator: arena).cast(),
        text.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  bool fileExists(String fileName) {
    return using(
      (arena) => native.FileExists(
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  bool directoryExists(String dirPath) {
    return using(
      (arena) => native.DirectoryExists(
        dirPath.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  bool isFileExtension(String fileName, String ext) {
    return using(
      (arena) => native.IsFileExtension(
        fileName.toNativeUtf8(allocator: arena).cast(),
        ext.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  int getFileLength(String fileName) {
    return using(
      (arena) => native.GetFileLength(
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  String getFileExtension(String fileName) {
    return using(
      (arena) => native.GetFileExtension(
        fileName.toNativeUtf8(allocator: arena).cast(),
      ).cast<Utf8>().toDartString(),
    );
  }

  String getFileName(String filePath) {
    return using(
      (arena) => native.GetFileName(
        filePath.toNativeUtf8(allocator: arena).cast(),
      ).cast<Utf8>().toDartString(),
    );
  }

  String getFileNameWithoutExt(String filePath) {
    return using(
      (arena) => native.GetFileNameWithoutExt(
        filePath.toNativeUtf8(allocator: arena).cast(),
      ).cast<Utf8>().toDartString(),
    );
  }

  String getDirectoryPath(String filePath) {
    return using(
      (arena) => native.GetDirectoryPath(
        filePath.toNativeUtf8(allocator: arena).cast(),
      ).cast<Utf8>().toDartString(),
    );
  }

  String getPrevDirectoryPath(String dirPath) {
    return using(
      (arena) => native.GetPrevDirectoryPath(
        dirPath.toNativeUtf8(allocator: arena).cast(),
      ).cast<Utf8>().toDartString(),
    );
  }

  String getWorkingDirectory() =>
      native.GetWorkingDirectory().cast<Utf8>().toDartString();

  String getApplicationDirectory() =>
      native.GetApplicationDirectory().cast<Utf8>().toDartString();

  bool isPathFile(String path) {
    return using(
      (arena) => native.IsPathFile(
        path.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  List<String> loadDirectoryFiles(String dirPath) {
    return using(
      (arena) {
        final pathList = native.LoadDirectoryFiles(
          dirPath.toNativeUtf8(allocator: arena).cast(),
        );
        final List<String> result = [];

        for (int i = 0; i < pathList.count; i++) {
          result.add(pathList.paths[i].cast<Utf8>().toDartString());
        }

        try {
          return result;
        } finally {
          native.UnloadDirectoryFiles(pathList);
        }
      },
    );
  }

  List<String> loadDirectoryFilesEx(
    String basePath, {
    String? filter,
    bool scanSubdirs = false,
  }) {
    return using(
      (arena) {
        final pathList = native.LoadDirectoryFilesEx(
          basePath.toNativeUtf8(allocator: arena).cast(),
          filter?.toNativeUtf8(allocator: arena).cast() ?? nullptr,
          scanSubdirs,
        );
        final List<String> result = [];

        for (int i = 0; i < pathList.count; i++) {
          result.add(pathList.paths[i].cast<Utf8>().toDartString());
        }

        try {
          return result;
        } finally {
          native.UnloadDirectoryFiles(pathList);
        }
      },
    );
  }

  bool isFileDropped() => native.IsFileDropped();

  List<String> loadDroppedFiles() {
    return using(
      (arena) {
        final pathList = native.LoadDroppedFiles();
        final List<String> result = [];

        for (int i = 0; i < pathList.count; i++) {
          result.add(pathList.paths[i].cast<Utf8>().toDartString());
        }

        try {
          return result;
        } finally {
          native.UnloadDroppedFiles(pathList);
        }
      },
    );
  }

  int getFileModTime(String fileName) {
    return using(
      (arena) => native.GetFileModTime(
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }
}
