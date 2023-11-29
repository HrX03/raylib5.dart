part of '../../raylib.dart';

mixin _AudioMusicManagementModule on _RayLibBase {
  Music loadMusicStream(String fileName) {
    return using(
      (arena) => Music.fromRef(
        native.LoadMusicStream(fileName.toNativeUtf8(allocator: arena).cast()),
      ),
    );
  }

  Music loadMusicStreamFromMemory(String fileType, Uint8List data) {
    return using(
      (arena) => Music.fromRef(
        native.LoadMusicStreamFromMemory(
          fileType.toNativeUtf8(allocator: arena).cast(),
          byteListToUintPointer(data, allocator: arena).cast(),
          data.length,
        ),
      ),
    );
  }

  bool isMusicReady(Music music) => native.IsMusicReady(music.ref);

  void unloadMusicStream(Music music) => native.UnloadMusicStream(music.ref);

  void playMusicStream(Music music) => native.PlayMusicStream(music.ref);

  bool isMusicStreamPlaying(Music music) =>
      native.IsMusicStreamPlaying(music.ref);

  void updateMusicStream(Music music) => native.UpdateMusicStream(music.ref);

  void stopMusicStream(Music music) => native.StopMusicStream(music.ref);

  void pauseMusicStream(Music music) => native.PauseMusicStream(music.ref);

  void resumeMusicStream(Music music) => native.ResumeMusicStream(music.ref);

  void seekMusicStream(Music music, double position) =>
      native.SeekMusicStream(music.ref, position);

  void setMusicVolume(Music music, double volume) =>
      native.SetMusicVolume(music.ref, volume);

  void setMusicPitch(Music music, double pitch) =>
      native.SetMusicPitch(music.ref, pitch);

  void setMusicPan(Music music, double pan) =>
      native.SetMusicPan(music.ref, pan);

  double getMusicTimeLength(Music music) =>
      native.GetMusicTimeLength(music.ref);

  double getMusicTimePlayed(Music music) =>
      native.GetMusicTimePlayed(music.ref);
}
