part of '../../raylib.dart';

mixin _AudioStreamManagementModule on _RayLibBase {
  AudioStream loadAudioStream(int sampleRate, int sampleSize, int channels) =>
      AudioStream.fromRef(
        native.LoadAudioStream(sampleRate, sampleSize, channels),
      );

  bool isAudioStreamReady(AudioStream stream) =>
      native.IsAudioStreamReady(stream.ref);

  void unloadAudioStream(AudioStream stream) =>
      native.UnloadAudioStream(stream.ref);

  void updateAudioStream(AudioStream stream, Uint8List data) {
    return using(
      (arena) => native.UpdateAudioStream(
        stream.ref,
        byteListToUintPointer(data, allocator: arena).cast(),
        data.length,
      ),
    );
  }

  bool isAudioStreamProcessed(AudioStream stream) =>
      native.IsAudioStreamProcessed(stream.ref);

  void playAudioStream(AudioStream stream) =>
      native.PlayAudioStream(stream.ref);

  void pauseAudioStream(AudioStream stream) =>
      native.PauseAudioStream(stream.ref);

  void resumeAudioStream(AudioStream stream) =>
      native.ResumeAudioStream(stream.ref);

  bool isAudioStreamPlaying(AudioStream stream) =>
      native.IsAudioStreamPlaying(stream.ref);

  void stopAudioStream(AudioStream stream) =>
      native.StopAudioStream(stream.ref);

  void setAudioStreamVolume(AudioStream stream, double volume) =>
      native.SetAudioStreamVolume(stream.ref, volume);

  void setAudioStreamPitch(AudioStream stream, double pitch) =>
      native.SetAudioStreamPitch(stream.ref, pitch);

  void setAudioStreamPan(AudioStream stream, double pan) =>
      native.SetAudioStreamPan(stream.ref, pan);

  void setAudioStreamBufferSizeDefault(int size) =>
      native.SetAudioStreamBufferSizeDefault(size);

  void setAudioStreamCallback(AudioStream stream, AudioCallback callback) {
    final callable = NativeCallable<raylib.AudioCallbackFunction>.isolateLocal(
      callback.wrap(),
    );

    return native.SetAudioStreamCallback(stream.ref, callable.nativeFunction);
  }
}
