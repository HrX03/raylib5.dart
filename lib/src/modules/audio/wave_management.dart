part of '../../raylib.dart';

mixin _AudioWaveManagementModule on _RayLibBase {
  void playSound(Sound sound) => native.PlaySound(sound.ref);

  void stopSound(Sound sound) => native.StopSound(sound.ref);

  void pauseSound(Sound sound) => native.PauseSound(sound.ref);

  void resumeSound(Sound sound) => native.ResumeSound(sound.ref);

  bool isSoundPlaying(Sound sound) => native.IsSoundPlaying(sound.ref);

  void setSoundVolume(Sound sound, double volume) =>
      native.SetSoundVolume(sound.ref, volume);

  void setSoundPitch(Sound sound, double pitch) =>
      native.SetSoundPitch(sound.ref, pitch);

  void setSoundPan(Sound sound, double pan) =>
      native.SetSoundPan(sound.ref, pan);

  Wave waveCopy(Wave wave) => Wave.fromRef(native.WaveCopy(wave.ref));

  void waveCrop(Wave wave, int initSample, int finalSample) =>
      native.WaveCrop(wave.getPointer(), initSample, finalSample);

  void waveFormat(Wave wave, int sampleRate, int sampleSize, int channels) =>
      native.WaveFormat(wave.getPointer(), sampleRate, sampleSize, channels);

  List<double> loadWaveSamples(Wave wave) {
    final pointer = native.LoadWaveSamples(wave.ref);
    try {
      return pointerToSamples(
        pointer,
        wave.frameCount * wave.channels,
      );
    } finally {
      native.UnloadWaveSamples(pointer);
    }
  }
}
