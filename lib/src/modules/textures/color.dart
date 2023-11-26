part of '../../raylib.dart';

mixin _TexturesColorModule on _RayLibBase {
  Color fade(Color color, double alpha) =>
      Color.fromRef(native.Fade(color.ref, alpha));

  int colorToInt(Color color) => native.ColorToInt(color.ref);

  Vector4 colorNormalize(Color color) =>
      Vector4.fromRef(native.ColorNormalize(color.ref));

  Color colorFromNormalized(Vector4 normalized) =>
      Color.fromRef(native.ColorFromNormalized(normalized.ref));

  Vector3 colorToHSV(Color color) =>
      Vector3.fromRef(native.ColorToHSV(color.ref));

  Color colorFromHSV(double hue, double saturation, double value) =>
      Color.fromRef(native.ColorFromHSV(hue, saturation, value));

  Color colorTint(Color color, Color tint) =>
      Color.fromRef(native.ColorTint(color.ref, tint.ref));

  Color colorBrightness(Color color, double factor) =>
      Color.fromRef(native.ColorBrightness(color.ref, factor));

  Color colorContrast(Color color, double contrast) =>
      Color.fromRef(native.ColorContrast(color.ref, contrast));

  Color colorAlpha(Color color, double alpha) =>
      Color.fromRef(native.ColorAlpha(color.ref, alpha));

  Color colorAlphaBlend(Color dst, Color src, Color tint) =>
      Color.fromRef(native.ColorAlphaBlend(dst.ref, src.ref, tint.ref));

  Color getColor(int hexValue) => Color.fromRef(native.GetColor(hexValue));

  Color getPixelColor(int srcByte, PixelFormat format) {
    return using((arena) {
      final byteP = arena<Int>()..value = srcByte;
      return Color.fromRef(native.GetPixelColor(byteP.cast(), format.value));
    });
  }

  int getPixelDataSize(int width, int height, PixelFormat format) =>
      native.GetPixelDataSize(width, height, format.value);
}
