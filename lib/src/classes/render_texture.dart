import 'package:raylib/src/classes/texture.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class RenderTexture extends NativeClass<raylib.RenderTexture> with Unloadable {
  RenderTexture.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadRenderTexture(ref);

  int get id => ref.id;
  Texture get texture => Texture.fromRef(ref.texture);
  Texture get depth => Texture.fromRef(ref.depth);
}

typedef RenderTexture2D = RenderTexture;
