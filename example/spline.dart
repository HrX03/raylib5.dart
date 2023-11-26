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

    if (raylib.isKeyPressed(KeyboardKey.space)) {
      final img = raylib.loadImageFromScreen();
      raylib.imageRotate(img, 30);
      raylib.imageBlurGaussian(img, 4);
      raylib.imageDrawCircleV(img, Vector2(200, 200), 20, Color.blue);
      raylib.exportImage(img, "output.png");
      raylib.traceLog(LogLevel.info, "Screen saved to output.png");
      raylib.unloadImage(img);
    }

    raylib.beginDrawing();

    raylib.clearBackground(Color.rayWhite);
    raylib.drawSplineCatmullRom(points, 2, Color.red);

    raylib.endDrawing();
  }
}
