import 'package:raylib/raylib.dart';

void main(List<String> args) {
  runRayLib(
    rayMain,
    sources: const LibrarySources(
      windows: "C:\\Users\\dnbia\\Projects\\raylib\\src\\raylib.dll",
    ),
  );
}

void rayMain() {
  initWindow(1280, 720, "spline");
  setTargetFPS(60);

  final List<Vector2> points = [];
  Image prevImage = genImageColor(1280, 720, Color.rayWhite);
  Texture2D texture = loadTextureFromImage(prevImage);

  while (!windowShouldClose()) {
    if (isMouseButtonDown(MouseButton.left)) {
      points.add(getMousePosition());
    } else if (isMouseButtonPressed(MouseButton.right)) {
      if (points.isNotEmpty) points.removeLast();
    }

    if (isKeyPressed(KeyboardKey.space)) {
      final img = loadImageFromScreen();
      imageRotate(img, 30);
      imageBlurGaussian(img, 4);
      imageDrawCircleV(img, Vector2(200, 200), 20, Color.blue);
      exportImage(img, "output.png");
      traceLog(LogLevel.info, "Screen saved to output.png");
      unloadImage(img);
    }

    drawingScope(() {
      clearBackground(Color.rayWhite);
      drawSplineCatmullRom(points, 2, Color.red);
      drawTexture(texture, 0, 0, fade(Color.blue, 0.2));

      prevImage.dispose();
      texture.dispose();

      prevImage = loadImageFromScreen();
      texture = loadTextureFromImage(prevImage);
    });
  }
}
