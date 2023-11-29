part of '../../raylib.dart';

mixin _AudioWaveLoadingModule on _RayLibBase {
  Wave loadWave(String fileName) {
    return using(
      (arena) => Wave.fromRef(
        native.LoadWave(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Wave loadWaveFromMemory(String fileType, Uint8List fileData) {
    return using(
      (arena) => Wave.fromRef(
        native.LoadWaveFromMemory(
          fileType.toNativeUtf8(allocator: arena).cast(),
          byteListToUintPointer(fileData, allocator: arena).cast(),
          fileData.length,
        ),
      ),
    );
  }

  bool isWaveReady(Wave wave) => native.IsWaveReady(wave.ref);

  Sound loadSound(String fileName) {
    return using(
      (arena) => Sound.fromRef(
        native.LoadSound(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Sound loadSoundFromWave(Wave wave) =>
      Sound.fromRef(native.LoadSoundFromWave(wave.ref));

  Sound loadSoundAlias(Sound source) =>
      Sound.fromRef(native.LoadSoundAlias(source.ref));

  bool isSoundReady(Sound sound) => native.IsSoundReady(sound.ref);

  void updateSound(Sound sound, Uint8List data, int sampleCount) {
    return using(
      (arena) => native.UpdateSound(
        sound.ref,
        byteListToUintPointer(data, allocator: arena).cast(),
        sampleCount,
      ),
    );
  }

  void unloadWave(Wave wave) => native.UnloadWave(wave.ref);

  void unloadSound(Sound sound) => native.UnloadSound(sound.ref);

  void unloadSoundAlias(Sound alias) => native.UnloadSoundAlias(alias.ref);

  bool exportWave(Wave wave, String fileName) {
    return using(
      (arena) => native.ExportWave(
        wave.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  bool exportWaveAsCode(Wave wave, String fileName) {
    return using(
      (arena) => native.ExportWaveAsCode(
        wave.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }
}
