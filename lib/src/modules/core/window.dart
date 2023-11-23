part of '../../raylib.dart';

mixin _CoreWindowModule on _RayLibBase {
  void initWindow(int width, int height, String title) {
    return using(
      (arena) => _native.InitWindow(
        width,
        height,
        title.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void closeWindow() => _native.CloseWindow();
  bool windowShouldClose() => _native.WindowShouldClose();
  bool isWindowReady() => _native.IsWindowReady();
  bool isWindowFullscreen() => _native.IsWindowFullscreen();
  bool isWindowHidden() => _native.IsWindowFullscreen();
  bool isWindowMinimized() => _native.IsWindowMinimized();
  bool isWindowMaximized() => _native.IsWindowMaximized();
  bool isWindowFocused() => _native.IsWindowFocused();
  bool isWindowResized() => _native.IsWindowResized();
  bool isWindowState(WindowFlag flag) => _native.IsWindowState(flag.value);
  void setWindowState(Set<WindowFlag> flags) =>
      _native.SetWindowState(flags.apply());
  void clearWindowState(Set<WindowFlag> flags) =>
      _native.ClearWindowState(flags.apply());
  void toggleFullscreen() => _native.ToggleFullscreen();
  void toggleBorderlessWindowed() => _native.ToggleBorderlessWindowed();
  void maximizeWindow() => _native.MaximizeWindow();
  void minimizeWindow() => _native.MinimizeWindow();
  void restoreWindow() => _native.RestoreWindow();
  void setWindowIcon(Image image) => _native.SetWindowIcon(image.ref);
  void setWindowIcons(List<Image> images) =>
      _native.SetWindowIcons(imageListToPointer(images), images.length);
  void setWindowTitle(String title) {
    return using(
      (arena) => _native.SetWindowTitle(
        title.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setWindowPosition(int x, int y) => _native.SetWindowPosition(x, y);
  void setWindowMonitor(int monitor) => _native.RestoreWindow();
  void setWindowMinSize(int width, int height) =>
      _native.SetWindowMinSize(width, height);
  void setWindowMaxSize(int width, int height) =>
      _native.SetWindowMaxSize(width, height);
  void setWindowSize(int width, int height) =>
      _native.SetWindowSize(width, height);
  void setWindowOpacity(double opacity) => _native.SetWindowOpacity(opacity);
  void setWindowFocused() => _native.SetWindowFocused();
  Pointer<Void> getWindowHandle() => _native.GetWindowHandle();
  int getScreenWidth() => _native.GetScreenWidth();
  int getScreenHeight() => _native.GetScreenHeight();
  int getRenderWidth() => _native.GetRenderWidth();
  int getRenderHeight() => _native.GetRenderHeight();
  int getMonitorCount() => _native.GetMonitorCount();
  int getCurrentMonitor() => _native.GetCurrentMonitor();
  Vector2 getMonitorPosition(int monitor) =>
      Vector2.fromRef(_native.GetMonitorPosition(monitor));
  int getMonitorWidth(int monitor) => _native.GetMonitorWidth(monitor);
  int getMonitorHeight(int monitor) => _native.GetMonitorHeight(monitor);
  int getMonitorPhysicalWidth(int monitor) =>
      _native.GetMonitorPhysicalWidth(monitor);
  int getMonitorPhysicalHeight(int monitor) =>
      _native.GetMonitorPhysicalHeight(monitor);
  int getMonitorRefreshRate(int monitor) => _native.GetMonitorWidth(monitor);
  Vector2 getWindowPosition() => Vector2.fromRef(_native.GetWindowPosition());
  Vector2 getWindowScaleDPI() => Vector2.fromRef(_native.GetWindowScaleDPI());
  String getMonitorName(int monitor) =>
      _native.GetMonitorName(monitor).cast<Utf8>().toDartString();
  void setClipboardText(String text) {
    return using(
      (arena) => _native.SetClipboardText(
        text.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  String getClipboardText() =>
      _native.GetClipboardText().cast<Utf8>().toDartString();
  void enableEventWaiting() => _native.EnableEventWaiting();
  void disableEventWaiting() => _native.DisableEventWaiting();
}
