import 'package:raylib/src/classes/audio_stream.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Sound extends NativeClass<raylib.Sound> with Unloadable {
  Sound.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadSound(ref);

  AudioStream get audioStream => AudioStream.fromRef(ref.stream);
}
