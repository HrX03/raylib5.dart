import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:raylib/raylib.dart';
import 'package:raylib/src/base/types.dart';
import 'package:raylib/src/base/uniform.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/utils/utils.dart';

part 'modules/core/advanced.dart';
part 'modules/core/automation.dart';
part 'modules/core/cursor.dart';
part 'modules/core/draw.dart';
part 'modules/core/encoding.dart';
part 'modules/core/fs.dart';
part 'modules/core/gamepad.dart';
part 'modules/core/gestures.dart';
part 'modules/core/keyboard.dart';
part 'modules/core/misc.dart';
part 'modules/core/mouse.dart';
part 'modules/core/random.dart';
part 'modules/core/screen_space.dart';
part 'modules/core/shader.dart';
part 'modules/core/timings.dart';
part 'modules/core/touch.dart';
part 'modules/core/utils.dart';
part 'modules/core/vr.dart';
part 'modules/core/window.dart';

part 'modules/shapes/basic.dart';
part 'modules/shapes/collision.dart';
part 'modules/shapes/spline_eval.dart';
part 'modules/shapes/splines.dart';

part 'modules/text/drawing.dart';
part 'modules/text/info.dart';
part 'modules/text/loading.dart';

part 'modules/textures/color.dart';
part 'modules/textures/image_drawing.dart';
part 'modules/textures/image_generation.dart';
part 'modules/textures/image_loading.dart';
part 'modules/textures/image_manipulation.dart';
part 'modules/textures/texture_configuration.dart';
part 'modules/textures/texture_drawing.dart';
part 'modules/textures/texture_loading.dart';

abstract class _RayLibBase {
  final raylib.RayLibNative native;

  const _RayLibBase(this.native);
}

class RayLib extends _RayLibBase
    with
        _CoreAdvancedModule,
        _CoreAutomationModule,
        _CoreCursorModule,
        _CoreDrawModule,
        _CoreEncodingModule,
        _CoreFsModule,
        _CoreGamepadModule,
        _CoreGesturesModule,
        _CoreMiscModule,
        _CoreMouseModule,
        _CoreKeyboardModule,
        _CoreRandomModule,
        _CoreScreenSpaceModule,
        _CoreShaderModule,
        _CoreTimingsModule,
        _CoreTouchModule,
        _CoreUtilsModule,
        _CoreVrModule,
        _CoreWindowModule,
        _ShapesBasicModules,
        _ShapesCollisionModule,
        _ShapesSplineEvalModule,
        _ShapesSplinesModule,
        _TextDrawingModule,
        _TextInfoModule,
        _TextLoadingModule,
        _TexturesColorModule,
        _TexturesImageDrawingModule,
        _TexturesImageGenerationModule,
        _TexturesImageLoadingModule,
        _TexturesImageManipulationModule,
        _TexturesTextureConfigurationModule,
        _TexturesTextureDrawingModule,
        _TexturesTextureLoadingModule {
  const RayLib._(super.native);

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
