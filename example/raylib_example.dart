import 'package:raylib/raylib.dart';

void main() {
  final raylib = RayLib.initWithSources(
    sources: const LibrarySources(windows: "./src/raylib.dll"),
  );

  raylib.initWindow(480, 360, "test");
  raylib.setTargetFPS(60);

  final list = raylib.loadAutomationEventList(
    raylib.fileExists("events.txt") ? "events.txt" : null,
  );
  raylib.setAutomationEventList(list);
  //raylib.setAutomationEventBaseFrame(0);
  //raylib.startAutomationEventRecording();
  final events = list.getEvents();
  bool playing = true;
  int eventPointer = 0;
  int frameCount = 0;

  while (!raylib.windowShouldClose()) {
    if (playing && events[eventPointer].frame == frameCount) {
      raylib.playAutomationEvent(events[eventPointer]);
      raylib.traceLog(LogLevel.info, "event n $eventPointer");
      eventPointer++;

      if (eventPointer >= events.length) {
        playing = false;
        raylib.traceLog(LogLevel.info, "done playing");
      }
    }

    raylib.beginDrawing();
    raylib.clearBackground(Color.rayWhite);

    final progress = raylib.getTime() % 2.0 / 2.0;
    final pos = progress * 320;
    final mousePos = raylib.getMousePosition();
    final clicking = raylib.isMouseButtonDown(MouseButton.left);
    final crosshairColor = clicking ? Color.blue : Color.black;

    /* if (raylib.isKeyPressed(KeyboardKey.space)) {
      raylib.stopAutomationEventRecording();
      raylib.exportAutomationEventList(list, "events.txt");
      raylib.unloadAutomationEventList(list);
    } */

    raylib.drawRectangleRoundedLines(
      Rectangle(pos, pos, 40, 40),
      0.4,
      0,
      4.0,
      Color.pink,
    );

    if (raylib.isCursorOnScreen()) {
      raylib.drawLineBezier(
        Vector2(mousePos.x, 0),
        Vector2(mousePos.x, 360),
        clicking ? 4.0 : 1.0,
        crosshairColor,
      );
      raylib.drawLineBezier(
        Vector2(0, mousePos.y),
        Vector2(480, mousePos.y),
        clicking ? 4.0 : 1.0,
        crosshairColor,
      );
    }

    raylib.drawText("${raylib.getFPS()}", 4, 4, 24, Color.red);
    raylib.endDrawing();

    frameCount++;
  }

  raylib.closeWindow();
}
