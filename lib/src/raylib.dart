import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:raylib/raylib.dart';
import 'package:raylib/src/base/uniform.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/utils/utils.dart';

part 'modules/core/cursor.dart';
part 'modules/core/draw.dart';
part 'modules/core/keyboard.dart';
part 'modules/core/mouse.dart';
part 'modules/core/screen_space.dart';
part 'modules/core/shader.dart';
part 'modules/core/timings.dart';
part 'modules/core/utils.dart';
part 'modules/core/window.dart';

part 'modules/shapes/basic.dart';
part 'modules/shapes/collision.dart';
part 'modules/shapes/spline_eval.dart';
part 'modules/shapes/splines.dart';

class _RayLibBase {
  final raylib.RayLibNative _native;

  const _RayLibBase(this._native);
}

class RayLib extends _RayLibBase
    with
        _CoreCursorModule,
        _CoreDrawModule,
        _CoreMouseModule,
        _CoreKeyboardModule,
        _CoreScreenSpaceModule,
        _CoreShaderModule,
        _ShapesBasicModules,
        _CoreTimingsModule,
        _CoreUtilsModule,
        _CoreWindowModule,
        _ShapesCollisionModule,
        _ShapesSplineEvalModule,
        _ShapesSplinesModule {
  const RayLib._(super._native);

  factory RayLib.initWithSources({required LibrarySources sources}) {
    return RayLib._(
      raylib.RayLibNative(
        DynamicLibrary.open(sources.resolveForCurrentPlatform()),
      ),
    );
  }
}

class LibrarySources {
  final String? android;
  final String? iOS;
  final String? windows;
  final String? linux;
  final String? macOS;

  const LibrarySources({
    this.android,
    this.iOS,
    this.windows,
    this.linux,
    this.macOS,
  });

  String resolveForCurrentPlatform() {
    return switch (null) {
          _ when Platform.isAndroid => android,
          _ when Platform.isWindows => windows,
          _ when Platform.isLinux => linux,
          _ when Platform.isIOS => iOS,
          _ when Platform.isMacOS => macOS,
          _ => throw UnsupportedError("Unsupported platform"),
        } ??
        (throw UnsupportedError("No library available for current platform"));
  }
}
