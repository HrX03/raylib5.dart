part of '../../raylib.dart';

mixin _ModelsModelDrawingModule on _RayLibBase {
  void drawModel(Model model, Vector3 position, double scale, Color tint) =>
      native.DrawModel(model.ref, position.ref, scale, tint.ref);

  void drawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  ) =>
      native.DrawModelEx(
        model.ref,
        position.ref,
        rotationAxis.ref,
        rotationAngle,
        scale.ref,
        tint.ref,
      );

  void drawModelWires(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  ) =>
      native.DrawModelWires(model.ref, position.ref, scale, tint.ref);

  void drawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  ) =>
      native.DrawModelWiresEx(
        model.ref,
        position.ref,
        rotationAxis.ref,
        rotationAngle,
        scale.ref,
        tint.ref,
      );

  void drawBoundingBox(BoundingBox box, Color color) =>
      native.DrawBoundingBox(box.ref, color.ref);

  void drawBillboard(
    Camera camera,
    Texture2D texture,
    Vector3 position,
    double size,
    Color tint,
  ) =>
      native.DrawBillboard(
        camera.ref,
        texture.ref,
        position.ref,
        size,
        tint.ref,
      );

  void drawBillboardRec(
    Camera camera,
    Texture2D texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  ) =>
      native.DrawBillboardRec(
        camera.ref,
        texture.ref,
        source.ref,
        position.ref,
        size.ref,
        tint.ref,
      );

  void drawBillboardPro(
    Camera camera,
    Texture2D texture,
    Rectangle source,
    Vector3 position,
    Vector3 up,
    Vector2 size,
    Vector2 origin,
    double rotation,
    Color tint,
  ) =>
      native.DrawBillboardPro(
        camera.ref,
        texture.ref,
        source.ref,
        position.ref,
        up.ref,
        size.ref,
        origin.ref,
        rotation,
        tint.ref,
      );
}
