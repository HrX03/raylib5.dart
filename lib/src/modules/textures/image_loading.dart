part of '../../raylib.dart';

mixin _TexturesImageLoadingModule on _RayLibBase {
  Image loadImage(String fileName) {
    return using(
      (arena) => Image.fromRef(
        native.LoadImage(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Image loadImageRaw(
    String fileName,
    int width,
    int height,
    PixelFormat format,
    int headerSize,
  ) {
    return using(
      (arena) => Image.fromRef(
        native.LoadImageRaw(
          fileName.toNativeUtf8(allocator: arena).cast(),
          width,
          height,
          format.value,
          headerSize,
        ),
      ),
    );
  }

  Image loadImageSvg(String fileNameOrString, int width, int height) {
    return using(
      (arena) => Image.fromRef(
        native.LoadImageSvg(
          fileNameOrString.toNativeUtf8(allocator: arena).cast(),
          width,
          height,
        ),
      ),
    );
  }

  ImageSequence loadImageAnim(String fileName) {
    return using((arena) {
      final frameCountP = arena<Int>();
      final img = native.LoadImageAnim(
        fileName.toNativeUtf8(allocator: arena).cast(),
        frameCountP,
      );

      return (Image.fromRef(img), frameCountP.value);
    });
  }

  Image loadImageFromMemory(String fileType, Uint8List fileData) {
    return using(
      (arena) => Image.fromRef(
        native.LoadImageFromMemory(
          fileType.toNativeUtf8(allocator: arena).cast(),
          byteListToUintPointer(fileData, allocator: arena).cast(),
          fileData.length,
        ),
      ),
    );
  }

  Image loadImageFromTexture(Texture2D texture) =>
      Image.fromRef(native.LoadImageFromTexture(texture.ref));

  Image loadImageFromScreen() => Image.fromRef(native.LoadImageFromScreen());

  bool isImageReady(Image image) => native.IsImageReady(image.ref);

  void unloadImage(Image image) => native.UnloadImage(image.ref);

  bool exportImage(Image image, String fileName) {
    return using(
      (arena) => native.ExportImage(
        image.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  Uint8List exportImageToMemory(Image image, String fileType) {
    return using((arena) {
      final fileSizeP = arena<Int>();
      final bytes = native.ExportImageToMemory(
        image.ref,
        fileType.toNativeUtf8(allocator: arena).cast(),
        fileSizeP,
      );

      return uintPointerToByteList(bytes.cast(), fileSizeP.value);
    });
  }

  bool exportImageAsCode(Image image, String fileName) {
    return using(
      (arena) => native.ExportImageAsCode(
        image.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }
}
