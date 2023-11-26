part of '../../raylib.dart';

mixin _TexturesTextureConfigurationModule on _RayLibBase {
  void genTextureMipmaps(Texture2D texture) =>
      native.GenTextureMipmaps(texture.getPointer());

  void setTextureFilter(Texture2D texture, TextureFilter filter) =>
      native.SetTextureFilter(texture.ref, filter.index);

  void setTextureWrap(Texture2D texture, TextureWrap wrap) =>
      native.SetTextureWrap(texture.ref, wrap.index);
}
