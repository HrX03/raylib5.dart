part of '../../raylib.dart';

mixin _CoreAdvancedModule on _RayLibBase {
  void swapScreenBuffer() => native.SwapScreenBuffer();

  void pollInputEvents() => native.PollInputEvents();

  void waitTime(double seconds) => native.WaitTime(seconds);

  void setTraceLogCallback(TraceLogCallback callback) {
    final callable =
        NativeCallable<raylib.TraceLogCallbackFunction>.isolateLocal(
      callback.wrap(),
    );

    return native.SetTraceLogCallback(callable.nativeFunction);
  }

  void setLoadFileDataCallback(LoadFileDataCallback callback) {
    final callable =
        NativeCallable<raylib.LoadFileDataCallbackFunction>.isolateLocal(
      callback.wrap(),
    );

    return native.SetLoadFileDataCallback(callable.nativeFunction);
  }

  void setSaveFileDataCallback(SaveFileDataCallback callback) {
    final callable =
        NativeCallable<raylib.SaveFileDataCallbackFunction>.isolateLocal(
      callback.wrap(),
      exceptionalReturn: false,
    );

    return native.SetSaveFileDataCallback(callable.nativeFunction);
  }

  void setLoadFileTextCallback(LoadFileTextCallback callback) {
    final callable =
        NativeCallable<raylib.LoadFileTextCallbackFunction>.isolateLocal(
      callback.wrap(),
    );

    return native.SetLoadFileTextCallback(callable.nativeFunction);
  }

  void setSaveFileTextCallback(SaveFileTextCallback callback) {
    final callable =
        NativeCallable<raylib.SaveFileTextCallbackFunction>.isolateLocal(
      callback.wrap(),
      exceptionalReturn: false,
    );

    return native.SetSaveFileTextCallback(callable.nativeFunction);
  }
}
