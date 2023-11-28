import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/internal/pointer_list.dart';

class Shader extends NativeClass<raylib.Shader> with Unloadable {
  Shader.fromRef(super.ref) : super.fromRef();

  @override
  void unload(raylib.RayLibNative native) => native.UnloadShader(ref);

  int get id => ref.id;
  PointerList<Int> get locs => PointerList(ref.locs);
}
