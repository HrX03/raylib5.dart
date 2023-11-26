part of '../../raylib.dart';

mixin _TexturesTextureDrawingModule on _RayLibBase {
  void drawTexture(Texture2D texture, int posX, int posY, Color tint) =>
      native.DrawTexture(texture.ref, posX, posY, tint.ref);

  void drawTextureV(Texture2D texture, Vector2 position, Color tint) =>
      native.DrawTextureV(texture.ref, position.ref, tint.ref);

  void drawTextureEx(
    Texture2D texture,
    Vector2 position,
    double rotation,
    double scale,
    Color tint,
  ) =>
      native.DrawTextureEx(
        texture.ref,
        position.ref,
        rotation,
        scale,
        tint.ref,
      );

  void drawTextureRec(
    Texture2D texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  ) =>
      native.DrawTextureRec(texture.ref, source.ref, position.ref, tint.ref);

  void drawTexturePro(
    Texture2D texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  ) =>
      native.DrawTexturePro(
        texture.ref,
        source.ref,
        dest.ref,
        origin.ref,
        rotation,
        tint.ref,
      );

  void drawTextureNPatch(
    Texture2D texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  ) =>
      native.DrawTextureNPatch(
        texture.ref,
        nPatchInfo.ref,
        dest.ref,
        origin.ref,
        rotation,
        tint.ref,
      );
}
