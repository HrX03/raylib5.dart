part of '../../raylib.dart';

mixin _CoreUtilsModule on _RayLibBase {
  void traceLog(LogLevel logLevel, String text) {
    return using(
      (arena) => native.TraceLog(
        logLevel.index,
        text.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setTraceLogLevel(LogLevel logLevel) =>
      native.SetTraceLogLevel(logLevel.index);
}
