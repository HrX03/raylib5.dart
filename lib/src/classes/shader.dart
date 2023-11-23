import 'dart:ffi';

import 'package:raylib/src/base/native.dart';
import 'package:raylib/src/base/pointer_list.dart';
import 'package:raylib/src/enums/shader.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;

class Shader extends NativeClass<raylib.Shader> {
  Shader.fromRef(super.ref) : super.fromRef();

  int get id => ref.id;
  PointerList<Int, int, ShaderLocation> get locs =>
      PointerList(ref.locs, (v) => ShaderLocation.values[v]);
}
