import 'package:raylib/src/enums/textures.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class Texture extends NativeClass<raylib.Texture> with Pointable, Unloadable {
  Texture.fromRef(super.ref) : super.fromRef();

  @override
  raylib.Texture get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.Texture> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.Texture>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  @override
  void unload(raylib.RayLibNative native) => native.UnloadTexture(ref);

  int get id => ref.id;
  int get width => ref.width;
  int get height => ref.height;
  int get mipmaps => ref.mipmaps;
  PixelFormat get format => PixelFormat.values[ref.format - 1];
}

typedef Texture2D = Texture;
typedef TextureCubemap = Texture;
