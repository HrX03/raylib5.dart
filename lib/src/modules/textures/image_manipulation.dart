part of '../../raylib.dart';

mixin _TexturesImageManipulationModule on _RayLibBase {
  Image imageCopy(Image image) => Image.fromRef(native.ImageCopy(image.ref));

  Image imageFromImage(Image image, Rectangle rec) =>
      Image.fromRef(native.ImageFromImage(image.ref, rec.ref));

  Image imageText(String text, int fontSize, Color color) {
    return using(
      (arena) => Image.fromRef(
        native.ImageText(
          text.toNativeUtf8(allocator: arena).cast(),
          fontSize,
          color.ref,
        ),
      ),
    );
  }

  Image imageTextEx(
    Font font,
    String text,
    double fontSize,
    double spacing,
    Color tint,
  ) {
    return using(
      (arena) => Image.fromRef(
        native.ImageTextEx(
          font.ref,
          text.toNativeUtf8(allocator: arena).cast(),
          fontSize,
          spacing,
          tint.ref,
        ),
      ),
    );
  }

  void imageFormat(Image image, PixelFormat newFormat) =>
      native.ImageFormat(image.getPointer(), newFormat.value);

  void imageToPOT(Image image, Color fill) =>
      native.ImageToPOT(image.getPointer(), fill.ref);

  void imageCrop(Image image, Rectangle crop) =>
      native.ImageCrop(image.getPointer(), crop.ref);

  void imageAlphaCrop(Image image, double threshold) =>
      native.ImageAlphaCrop(image.getPointer(), threshold);

  void imageAlphaClear(Image image, Color color, double threshold) =>
      native.ImageAlphaClear(
        image.getPointer(),
        color.ref,
        threshold,
      );

  void imageAlphaMask(Image image, Image alphaMask) =>
      native.ImageAlphaMask(image.getPointer(), alphaMask.ref);

  void imageAlphaPremultiply(Image image) =>
      native.ImageAlphaPremultiply(image.getPointer());

  void imageBlurGaussian(Image image, int blurSize) =>
      native.ImageBlurGaussian(image.getPointer(), blurSize);

  void imageResize(Image image, int newWidth, int newHeight) =>
      native.ImageResize(image.getPointer(), newWidth, newHeight);

  void imageResizeNN(Image image, int newWidth, int newHeight) =>
      native.ImageResizeNN(image.getPointer(), newWidth, newHeight);

  void imageResizeCanvas(
    Image image,
    int newWidth,
    int newHeight,
    int offsetX,
    int offsetY,
    Color fill,
  ) =>
      native.ImageResizeCanvas(
        image.getPointer(),
        newWidth,
        newHeight,
        offsetX,
        offsetY,
        fill.ref,
      );

  void imageMipmaps(Image image) => native.ImageMipmaps(image.getPointer());

  void imageDither(Image image, int rBpp, int gBpp, int bBpp, int aBpp) =>
      native.ImageDither(image.getPointer(), rBpp, gBpp, bBpp, aBpp);

  void imageFlipVertical(Image image) =>
      native.ImageFlipVertical(image.getPointer());

  void imageFlipHorizontal(Image image) =>
      native.ImageFlipHorizontal(image.getPointer());

  void imageRotate(Image image, int degrees) =>
      native.ImageRotate(image.getPointer(), degrees);

  void imageRotateCW(Image image) => native.ImageRotateCW(image.getPointer());

  void imageRotateCCW(Image image) => native.ImageRotateCCW(image.getPointer());

  void imageColorTint(Image image, Color color) =>
      native.ImageColorTint(image.getPointer(), color.ref);

  void imageColorInvert(Image image) =>
      native.ImageColorInvert(image.getPointer());

  void imageColorGrayscale(Image image) =>
      native.ImageColorGrayscale(image.getPointer());

  void imageColorContrast(Image image, double contrast) =>
      native.ImageColorContrast(image.getPointer(), contrast);

  void imageColorBrightness(Image image, int brightness) =>
      native.ImageColorBrightness(image.getPointer(), brightness);

  void imageColorReplace(Image image, Color color, Color replace) =>
      native.ImageColorReplace(image.getPointer(), color.ref, replace.ref);

  List<Color> loadImageColors(Image image) {
    final colorsP = native.LoadImageColors(image.ref);

    final List<Color> colors = [];
    for (int i = 0; i < image.width * image.height; i++) {
      colors[i] = Color.fromRef(colorsP[i]);
    }

    try {
      return colors;
    } finally {
      native.UnloadImageColors(colorsP);
    }
  }

  List<Color> loadImagePalette(Image image, int maxPaletteSize) {
    return using((arena) {
      final colorCountP = arena<Int>();
      final colorsP =
          native.LoadImagePalette(image.ref, maxPaletteSize, colorCountP);

      final List<Color> colors = [];
      for (int i = 0; i < colorCountP.value; i++) {
        colors[i] = Color.fromRef(colorsP[i]);
      }

      try {
        return colors;
      } finally {
        native.UnloadImagePalette(colorsP);
      }
    });
  }

  Rectangle getImageAlphaBorder(Image image, double threshold) =>
      Rectangle.fromRef(native.GetImageAlphaBorder(image.ref, threshold));

  Color getImageColor(Image image, int x, int y) =>
      Color.fromRef(native.GetImageColor(image.ref, x, y));
}
