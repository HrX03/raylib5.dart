part of '../../raylib.dart';

mixin _TexturesImageGenerationModule on _RayLibBase {
  Image genImageColor(int width, int height, Color color) =>
      Image.fromRef(native.GenImageColor(width, height, color.ref));

  Image genImageGradientLinear(
    int width,
    int height,
    int direction,
    Color start,
    Color end,
  ) =>
      Image.fromRef(
        native.GenImageGradientLinear(
          width,
          height,
          direction,
          start.ref,
          end.ref,
        ),
      );

  Image genImageGradientRadial(
    int width,
    int height,
    double density,
    Color inner,
    Color outer,
  ) =>
      Image.fromRef(
        native.GenImageGradientRadial(
          width,
          height,
          density,
          inner.ref,
          outer.ref,
        ),
      );

  Image genImageGradientSquare(
    int width,
    int height,
    double density,
    Color inner,
    Color outer,
  ) =>
      Image.fromRef(
        native.GenImageGradientSquare(
          width,
          height,
          density,
          inner.ref,
          outer.ref,
        ),
      );

  Image genImageChecked(
    int width,
    int height,
    int checksX,
    int checksY,
    Color col1,
    Color col2,
  ) =>
      Image.fromRef(
        native.GenImageChecked(
          width,
          height,
          checksX,
          checksY,
          col1.ref,
          col2.ref,
        ),
      );

  Image genImageWhiteNoise(
    int width,
    int height,
    double factor,
  ) =>
      Image.fromRef(native.GenImageWhiteNoise(width, height, factor));

  Image genImagePerlinNoise(
    int width,
    int height,
    int offsetX,
    int offsetY,
    double scale,
  ) =>
      Image.fromRef(
        native.GenImagePerlinNoise(width, height, offsetX, offsetY, scale),
      );

  Image genImageCellular(int width, int height, int tileSize) =>
      Image.fromRef(native.GenImageCellular(width, height, tileSize));

  Image genImageText(int width, int height, String text) {
    return using(
      (arena) => Image.fromRef(
        native.GenImageText(
          width,
          height,
          text.toNativeUtf8(allocator: arena).cast(),
        ),
      ),
    );
  }
}
