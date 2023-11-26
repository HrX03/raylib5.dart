import 'package:raylib/src/classes/rectangle.dart';
import 'package:raylib/src/enums/n_patch_layout.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';

class NPatchInfo extends NativeClass<raylib.NPatchInfo> {
  NPatchInfo.fromRef(super.ref) : super.fromRef();

  Rectangle get source => Rectangle.fromRef(ref.source);
  int get left => ref.left;
  int get top => ref.top;
  int get right => ref.right;
  int get bottom => ref.bottom;
  NPatchLayout get layout => NPatchLayout.values[ref.layout];
}
