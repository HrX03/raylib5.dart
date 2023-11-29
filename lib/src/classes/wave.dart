import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Wave extends NativeClass<raylib.Wave> with Pointable, Unloadable {
  Wave.fromRef(super.ref) : super.fromRef();

  @override
  raylib.Wave get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.Wave> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.Wave>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  @override
  void unload(raylib.RayLibNative native) => native.UnloadWave(ref);

  int get frameCount => ref.frameCount;
  int get sampleRate => ref.sampleRate;
  int get sampleSize => ref.sampleSize;
  int get channels => ref.channels;
}
