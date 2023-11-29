import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class AudioStream extends NativeClass<raylib.AudioStream> with Unloadable {
  AudioStream.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadAudioStream(ref);

  int get sampleRate => ref.sampleRate;
  int get sampleSize => ref.sampleSize;
  int get channels => ref.channels;
}
