import 'package:raylib/src/classes/audio_stream.dart';
import 'package:raylib/src/enums/music_context.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Music extends NativeClass<raylib.Music> with Unloadable {
  Music.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadMusicStream(ref);

  AudioStream get stream => AudioStream.fromRef(ref.stream);
  int get frameCount => ref.frameCount;
  bool get looping => ref.looping;

  MusicContextType get ctxType => MusicContextType.values[ref.ctxType];
}
