import 'dart:math' as math;

import 'package:raylib/raylib.dart';

const gravity = 400;
const playerJumpSpeed = 350.0;
const playerHorizontalSpeed = 200.0;

class Player {
  Vector2 position = Vector2.zero();
  double speed = 0.0;
  bool canJump = false;

  Player();
}

class EnvElement {
  final Rectangle rect;
  final bool blocking;
  final Color color;

  const EnvElement(
    this.rect,
    this.blocking,
    this.color,
  );
}

void main(List<String> args) {
  final raylib = RayLib.initWithSources(
    sources: const LibrarySources(
      windows: "C:\\Users\\dnbia\\Projects\\raylib\\src\\raylib.dll",
    ),
  );

  Color fade(Color color, double alpha) {
    return Color.fromRef(raylib.native.Fade(color.ref, alpha));
  }

  // Initialization
  //--------------------------------------------------------------------------------------
  const screenWidth = 800;
  const screenHeight = 450;

  raylib.initWindow(
    screenWidth,
    screenHeight,
    "raylib [core] example - automation events",
  );

  // Define player
  final player = Player();
  player.position = Vector2(400, 280);
  player.speed = 0;
  player.canJump = false;

  // Define environment elements (platforms)
  final envElements = [
    EnvElement(Rectangle(0, 0, 1000, 400), false, Color.lightGray),
    EnvElement(Rectangle(0, 400, 1000, 200), true, Color.gray),
    EnvElement(Rectangle(300, 200, 400, 10), true, Color.gray),
    EnvElement(Rectangle(250, 300, 100, 10), true, Color.gray),
    EnvElement(Rectangle(650, 300, 100, 10), true, Color.gray),
  ];

  // Define camera
  final camera = Camera2D();
  camera.target = player.position;
  camera.offset = Vector2(screenWidth / 2.0, screenHeight / 2.0);
  camera.rotation = 0.0;
  camera.zoom = 1.0;

  // Automation events
  // Initialize list of automation events to record new events
  AutomationEventList aelist = raylib.loadAutomationEventList();
  raylib.setAutomationEventList(aelist);
  bool eventRecording = false;
  bool eventPlaying = false;

  int frameCounter = 0;
  int playFrameCounter = 0;
  int currentPlayFrame = 0;

  List<AutomationEvent>? events;
  raylib.setTargetFPS(60);
  //--------------------------------------------------------------------------------------

  // Main game loop
  while (!raylib.windowShouldClose()) {
    // Update
    //----------------------------------------------------------------------------------
    const deltaTime = 0.015; //GetFrameTime();

    // Dropped files logic
    //----------------------------------------------------------------------------------
    if (raylib.isFileDropped()) {
      final droppedFiles = raylib.loadDroppedFiles();

      // Supports loading .rgs style files (text or binary) and .png style palette images
      if (raylib.isFileExtension(droppedFiles[0], ".txt;.rae")) {
        raylib.unloadAutomationEventList(aelist);
        aelist = raylib.loadAutomationEventList(droppedFiles[0]);

        eventRecording = false;

        // Reset scene state to play
        eventPlaying = true;
        playFrameCounter = 0;
        currentPlayFrame = 0;

        player.position = Vector2(400, 280);
        player.speed = 0;
        player.canJump = false;

        camera.target = player.position;
        camera.offset = Vector2(screenWidth / 2.0, screenHeight / 2.0);
        camera.rotation = 0.0;
        camera.zoom = 1.0;
      }
    }
    //----------------------------------------------------------------------------------

    // Update player
    //----------------------------------------------------------------------------------
    if (raylib.isKeyDown(KeyboardKey.left)) {
      player.position.x -= playerHorizontalSpeed * deltaTime;
    }
    if (raylib.isKeyDown(KeyboardKey.right)) {
      player.position.x += playerHorizontalSpeed * deltaTime;
    }
    if (raylib.isKeyDown(KeyboardKey.space) && player.canJump) {
      player.speed = -playerJumpSpeed;
      player.canJump = false;
    }

    bool hitObstacle = false;
    for (int i = 0; i < envElements.length; i++) {
      final element = envElements[i];
      final p = player.position;
      if (element.blocking &&
          element.rect.x <= p.x &&
          element.rect.x + element.rect.width >= p.x &&
          element.rect.y >= p.y &&
          element.rect.y <= p.y + player.speed * deltaTime) {
        hitObstacle = true;
        player.speed = 0.0;
        p.y = element.rect.y;
      }
    }

    if (!hitObstacle) {
      player.position.y += player.speed * deltaTime;
      player.speed += gravity * deltaTime;
      player.canJump = false;
    } else {
      player.canJump = true;
    }

    camera.zoom += raylib.getMouseWheelMove() * 0.05;
    camera.zoom = camera.zoom.clamp(0.25, 3.0);

    if (raylib.isKeyPressed(KeyboardKey.r)) {
      // Reset game state
      player.position = Vector2(400, 280);
      player.speed = 0;
      player.canJump = false;

      camera.target = player.position;
      camera.offset = Vector2(screenWidth / 2.0, screenHeight / 2.0);
      camera.rotation = 0.0;
      camera.zoom = 1.0;
    }
    //----------------------------------------------------------------------------------

    // Update camera
    //----------------------------------------------------------------------------------
    camera.target = player.position;
    camera.offset = Vector2(screenWidth / 2.0, screenHeight / 2.0);

    double minX = 1000;
    double minY = 1000;
    double maxX = -1000;
    double maxY = -1000;

    for (int i = 0; i < envElements.length; i++) {
      final element = envElements[i];
      minX = math.min(element.rect.x, minX);
      maxX = math.max(element.rect.x + element.rect.width, maxX);
      minY = math.min(element.rect.y, minY);
      maxY = math.max(element.rect.y + element.rect.height, maxY);
    }

    final max = raylib.getWorldToScreen2D(Vector2(maxX, maxY), camera);
    final min = raylib.getWorldToScreen2D(Vector2(minX, minY), camera);

    if (max.x < screenWidth) {
      camera.offset.x = screenWidth - (max.x - screenWidth / 2);
    }
    if (max.y < screenHeight) {
      camera.offset.y = screenHeight - (max.y - screenHeight / 2);
    }
    if (min.x > 0) camera.offset.x = screenWidth / 2 - min.x;
    if (min.y > 0) camera.offset.y = screenHeight / 2 - min.y;
    //----------------------------------------------------------------------------------

    // Toggle events recording
    if (raylib.isKeyPressed(KeyboardKey.s)) {
      if (!eventPlaying) {
        if (eventRecording) {
          raylib.stopAutomationEventRecording();
          eventRecording = false;

          raylib.exportAutomationEventList(aelist, "automation.rae");

          raylib.traceLog(LogLevel.info, "RECORDED FRAMES: ${aelist.count}");
        } else {
          raylib.setAutomationEventBaseFrame(180);
          raylib.startAutomationEventRecording();
          eventRecording = true;
        }
      }
    } else if (raylib.isKeyPressed(KeyboardKey.a)) {
      if (!eventRecording && (aelist.count > 0)) {
        // Reset scene state to play
        eventPlaying = true;
        events = aelist.getEvents();
        playFrameCounter = 0;
        currentPlayFrame = 0;

        player.position = Vector2(400, 280);
        player.speed = 0;
        player.canJump = false;

        camera.target = player.position;
        camera.offset = Vector2(screenWidth / 2.0, screenHeight / 2.0);
        camera.rotation = 0.0;
        camera.zoom = 1.0;
      }
    }

    if (eventPlaying) {
      // NOTE: Multiple events could be executed in a single frame
      while (playFrameCounter == events![currentPlayFrame].frame) {
        raylib.traceLog(
          LogLevel.info,
          "PLAYING: PlayFrameCount: $playFrameCounter | currentPlayFrame: $currentPlayFrame | Event Frame: ${events[currentPlayFrame].frame}, param: ${events[currentPlayFrame].params.$1}",
        );

        raylib.playAutomationEvent(events[currentPlayFrame]);
        currentPlayFrame++;

        if (currentPlayFrame == aelist.count) {
          eventPlaying = false;
          currentPlayFrame = 0;
          playFrameCounter = 0;

          raylib.traceLog(LogLevel.info, "FINISH PLAYING!");
          break;
        }
      }

      playFrameCounter++;
    }

    if (eventRecording || eventPlaying) {
      frameCounter++;
    } else {
      frameCounter = 0;
    }
    //----------------------------------------------------------------------------------

    // Draw
    //----------------------------------------------------------------------------------
    raylib.beginDrawing();

    raylib.clearBackground(Color.lightGray);

    raylib.beginMode2D(camera);

    // Draw environment elements
    for (int i = 0; i < envElements.length; i++) {
      raylib.drawRectangleRec(envElements[i].rect, envElements[i].color);
    }

    // Draw player rectangle
    raylib.drawRectangleRec(
      Rectangle(player.position.x - 20, player.position.y - 40, 40, 40),
      Color.red,
    );

    raylib.endMode2D();

    // Draw game controls
    raylib.drawRectangle(10, 10, 290, 145, fade(Color.skyBlue, 0.5));
    raylib.drawRectangleLines(10, 10, 290, 145, fade(Color.blue, 0.8));

    raylib.drawText("Controls:", 20, 20, 10, Color.black);
    raylib.drawText(
      "- RIGHT | LEFT: Player movement",
      30,
      40,
      10,
      Color.darkGray,
    );
    raylib.drawText("- SPACE: Player jump", 30, 60, 10, Color.darkGray);
    raylib.drawText("- R: Reset game state", 30, 80, 10, Color.darkGray);

    raylib.drawText(
      "- S: START/STOP RECORDING INPUT EVENTS",
      30,
      110,
      10,
      Color.black,
    );
    raylib.drawText(
      "- A: REPLAY LAST RECORDED INPUT EVENTS",
      30,
      130,
      10,
      Color.black,
    );

    // Draw automation events recording indicator
    if (eventRecording) {
      raylib.drawRectangle(10, 160, 290, 30, fade(Color.red, 0.3));
      raylib.drawRectangleLines(10, 160, 290, 30, fade(Color.maroon, 0.8));
      raylib.drawCircle(30, 175, 10, Color.maroon);

      if (((frameCounter / 15) % 2) == 1) {
        raylib.drawText(
          "RECORDING EVENTS... [${aelist.count}]",
          50,
          170,
          10,
          Color.maroon,
        );
      }
    } else if (eventPlaying) {
      raylib.drawRectangle(10, 160, 290, 30, fade(Color.lime, 0.3));
      raylib.drawRectangleLines(10, 160, 290, 30, fade(Color.darkGreen, 0.8));
      raylib.drawTriangle(
        Vector2(20, 155 + 10),
        Vector2(20, 155 + 30),
        Vector2(40, 155 + 20),
        Color.darkGreen,
      );

      if (((frameCounter / 15) % 2) == 1) {
        raylib.drawText(
          "PLAYING RECORDED EVENTS... [$currentPlayFrame]",
          50,
          170,
          10,
          Color.darkGreen,
        );
      }
    }

    raylib.endDrawing();
    //----------------------------------------------------------------------------------
  }

  // De-Initialization
  //--------------------------------------------------------------------------------------
  raylib.closeWindow(); // Close window and OpenGL context
  //--------------------------------------------------------------------------------------
}
