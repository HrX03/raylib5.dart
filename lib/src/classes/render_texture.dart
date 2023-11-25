import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/classes/texture.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class RenderTexture extends NativeClass<raylib.RenderTexture> {
  RenderTexture.fromRef(super.ref) : super.fromRef();

  @override
  Pointer<raylib.RenderTexture> getReference() {
    pointer ??= calloc<raylib.RenderTexture>();
    pointer!.ref = ref;
    return pointer!;
  }

  int get id => ref.id;
  Texture get texture => Texture.fromRef(ref.texture);
  Texture get depth => Texture.fromRef(ref.depth);
}

typedef RenderTexture2D = RenderTexture;