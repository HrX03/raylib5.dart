import 'package:raylib/src/classes/color.dart';
import 'package:raylib/src/classes/shader.dart';
import 'package:raylib/src/classes/texture.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/types.dart';

class MaterialMap extends NativeClass<raylib.MaterialMap> {
  MaterialMap.fromRef(super.ref) : super.fromRef();

  Texture2D get texture => Texture.fromRef(ref.texture);
  Color get color => Color.fromRef(ref.color);
  double get value => ref.value;
}

class Material extends NativeClass<raylib.Material> with Pointable, Unloadable {
  Material.fromRef(super.ref) : super.fromRef();

  @override
  raylib.Material get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.Material> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.Material>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  @override
  void unload(raylib.RayLibNative native) => native.UnloadMaterial(ref);

  Shader get shader => Shader.fromRef(ref.shader);

  TransformablePointerList<raylib.MaterialMap, MaterialMap> get maps =>
      TransformablePointerList(
        ref.maps,
        (v) => MaterialMap.fromRef(v),
      );

  Array4<double> get params => (
        ref.params[0],
        ref.params[1],
        ref.params[2],
        ref.params[3],
      );
}
