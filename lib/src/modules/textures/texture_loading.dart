part of '../../raylib.dart';

mixin _TexturesTextureLoadingModule on _RayLibBase {
  Texture2D loadTexture(String fileName) {
    return using(
      (arena) => Texture2D.fromRef(
        native.LoadTexture(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Texture2D loadTextureFromImage(Image image) =>
      Texture2D.fromRef(native.LoadTextureFromImage(image.ref));

  TextureCubemap loadTextureCubemap(Image image, CubemapLayout layout) =>
      TextureCubemap.fromRef(
        native.LoadTextureCubemap(image.ref, layout.index),
      );

  RenderTexture2D loadRenderTexture(int width, int height) =>
      RenderTexture2D.fromRef(native.LoadRenderTexture(width, height));

  bool isTextureReady(Texture2D texture) => native.IsTextureReady(texture.ref);

  void unloadTexture(Texture2D texture) => native.UnloadTexture(texture.ref);

  bool isRenderTextureReady(RenderTexture2D target) =>
      native.IsRenderTextureReady(target.ref);

  void unloadRenderTexture(RenderTexture2D target) =>
      native.UnloadRenderTexture(target.ref);

  void updateTexture(Texture2D texture, Uint8List pixels) {
    return using(
      (arena) => native.UpdateTexture(
        texture.ref,
        byteListToUintPointer(pixels, allocator: arena).cast(),
      ),
    );
  }

  void updateTextureRec(Texture2D texture, Rectangle rec, Uint8List pixels) {
    return using(
      (arena) => native.UpdateTextureRec(
        texture.ref,
        rec.ref,
        byteListToUintPointer(pixels, allocator: arena).cast(),
      ),
    );
  }
}
