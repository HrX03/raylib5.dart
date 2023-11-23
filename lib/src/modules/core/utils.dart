part of '../../raylib.dart';

mixin _CoreUtilsModule on _RayLibBase {
  void traceLog(LogLevel logLevel, String text) {
    return using(
      (arena) => _native.TraceLog(
        logLevel.index,
        text.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setTraceLogLevel(LogLevel logLevel) =>
      _native.SetTraceLogLevel(logLevel.index);
}
