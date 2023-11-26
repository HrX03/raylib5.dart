import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/internal/pointer_list.dart';

class Shader extends NativeClass<raylib.Shader> {
  Shader.fromRef(super.ref) : super.fromRef();

  int get id => ref.id;
  PointerList<Int> get locs => PointerList(ref.locs);
}
