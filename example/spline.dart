import 'package:raylib/raylib.dart';

void main(List<String> args) {
  final raylib = RayLib.initWithSources(
    sources: const LibrarySources(
      windows: "C:\\Users\\dnbia\\Projects\\raylib\\src\\raylib.dll",
    ),
  );
  raylib.initWindow(1280, 720, "spline");
  raylib.setTargetFPS(60);

  final List<Vector2> points = [];

  while (!raylib.windowShouldClose()) {
    if (raylib.isMouseButtonDown(MouseButton.left)) {
      points.add(raylib.getMousePosition());
    } else if (raylib.isMouseButtonPressed(MouseButton.right)) {
      if (points.isNotEmpty) points.removeLast();
    }

    raylib.beginDrawing();

    raylib.clearBackground(Color.rayWhite);
    raylib.drawSplineCatmullRom(points, 2, Color.red);

    raylib.endDrawing();
  }
}
