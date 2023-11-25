part of '../../raylib.dart';

mixin _CoreMiscModule on _RayLibBase {
  void takeScreenshot(String fileName) {
    return using(
      (arena) => native.TakeScreenshot(
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setConfigFlags(Set<ConfigFlag> flags) =>
      native.SetConfigFlags(flags.apply());

  void openURL(String url) {
    return using(
      (arena) => native.OpenURL(
        url.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }
}
