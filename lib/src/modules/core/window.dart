part of '../../raylib.dart';

mixin _CoreWindowModule on _RayLibBase {
  void initWindow(int width, int height, String title) {
    return using(
      (arena) => native.InitWindow(
        width,
        height,
        title.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void closeWindow() => native.CloseWindow();

  bool windowShouldClose() => native.WindowShouldClose();

  bool isWindowReady() => native.IsWindowReady();

  bool isWindowFullscreen() => native.IsWindowFullscreen();

  bool isWindowHidden() => native.IsWindowFullscreen();

  bool isWindowMinimized() => native.IsWindowMinimized();

  bool isWindowMaximized() => native.IsWindowMaximized();

  bool isWindowFocused() => native.IsWindowFocused();

  bool isWindowResized() => native.IsWindowResized();

  bool isWindowState(ConfigFlag flag) => native.IsWindowState(flag.value);

  void setWindowState(Set<ConfigFlag> flags) =>
      native.SetWindowState(flags.apply());

  void clearWindowState(Set<ConfigFlag> flags) =>
      native.ClearWindowState(flags.apply());

  void toggleFullscreen() => native.ToggleFullscreen();

  void toggleBorderlessWindowed() => native.ToggleBorderlessWindowed();

  void maximizeWindow() => native.MaximizeWindow();

  void minimizeWindow() => native.MinimizeWindow();

  void restoreWindow() => native.RestoreWindow();

  void setWindowIcon(Image image) => native.SetWindowIcon(image.ref);

  void setWindowIcons(List<Image> images) {
    return using(
      (arena) => native.SetWindowIcons(
        imageListToPointer(images, allocator: arena),
        images.length,
      ),
    );
  }

  void setWindowTitle(String title) {
    return using(
      (arena) => native.SetWindowTitle(
        title.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setWindowPosition(int x, int y) => native.SetWindowPosition(x, y);

  void setWindowMonitor(int monitor) => native.RestoreWindow();

  void setWindowMinSize(int width, int height) =>
      native.SetWindowMinSize(width, height);

  void setWindowMaxSize(int width, int height) =>
      native.SetWindowMaxSize(width, height);

  void setWindowSize(int width, int height) =>
      native.SetWindowSize(width, height);

  void setWindowOpacity(double opacity) => native.SetWindowOpacity(opacity);

  void setWindowFocused() => native.SetWindowFocused();

  Pointer<Void> getWindowHandle() => native.GetWindowHandle();

  int getScreenWidth() => native.GetScreenWidth();

  int getScreenHeight() => native.GetScreenHeight();

  int getRenderWidth() => native.GetRenderWidth();

  int getRenderHeight() => native.GetRenderHeight();

  int getMonitorCount() => native.GetMonitorCount();

  int getCurrentMonitor() => native.GetCurrentMonitor();

  Vector2 getMonitorPosition(int monitor) =>
      Vector2.fromRef(native.GetMonitorPosition(monitor));

  int getMonitorWidth(int monitor) => native.GetMonitorWidth(monitor);

  int getMonitorHeight(int monitor) => native.GetMonitorHeight(monitor);

  int getMonitorPhysicalWidth(int monitor) =>
      native.GetMonitorPhysicalWidth(monitor);

  int getMonitorPhysicalHeight(int monitor) =>
      native.GetMonitorPhysicalHeight(monitor);

  int getMonitorRefreshRate(int monitor) => native.GetMonitorWidth(monitor);

  Vector2 getWindowPosition() => Vector2.fromRef(native.GetWindowPosition());

  Vector2 getWindowScaleDPI() => Vector2.fromRef(native.GetWindowScaleDPI());

  String getMonitorName(int monitor) =>
      native.GetMonitorName(monitor).cast<Utf8>().toDartString();

  void setClipboardText(String text) {
    return using(
      (arena) => native.SetClipboardText(
        text.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  String getClipboardText() =>
      native.GetClipboardText().cast<Utf8>().toDartString();

  void enableEventWaiting() => native.EnableEventWaiting();

  void disableEventWaiting() => native.DisableEventWaiting();
}
