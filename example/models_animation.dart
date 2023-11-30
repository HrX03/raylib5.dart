import 'package:raylib/raylib.dart';

void main(List<String> args) {
  runRayLib(
    rayMain,
    sources: const LibrarySources(windows: "./src/raylib.dll"),
  );
}

void rayMain() {
  const int screenWidth = 800;
  const int screenHeight = 450;

  initWindow(
    screenWidth,
    screenHeight,
    "raylib [models] example - model animation",
  );

  // Define the camera to look into our 3d world
  final camera = Camera();
  camera.position = Vector3(10.0, 10.0, 10.0); // Camera position
  camera.target = Vector3.zero(); // Camera looking at point
  camera.up =
      Vector3(0.0, 1.0, 0.0); // Camera up vector (rotation towards target)
  camera.fovy = 45.0; // Camera field-of-view Y
  camera.projection = CameraProjection.perspective; // Camera mode type

  final model = loadModel(
    "./example/resources/guy.iqm",
  ); // Load the animated model mesh and basic data
  final texture = loadTexture(
    "./example/resources/guytex.png",
  ); // Load model texture and set material
  setMaterialTexture(
    model.getMaterials()[0],
    0,
    texture,
  ); // Set model material map texture

  final position = Vector3.zero(); // Set model position

  // Load animation data
  final anims = loadModelAnimations("./example/resources/guyanim.iqm");
  int animFrameCounter = 0;

  disableCursor(); // Catch cursor
  setTargetFPS(60); // Set our game to run at 60 frames-per-second
  //--------------------------------------------------------------------------------------

  // Main game loop
  final poses = anims[0].getFramePoses();
  while (!windowShouldClose()) // Detect window close button or ESC key
  {
    // Update
    //----------------------------------------------------------------------------------
    updateCamera(camera, CameraMode.firstPerson);

    // Play animation when spacebar is held down
    if (isKeyDown(KeyboardKey.space)) {
      animFrameCounter++;
      updateModelAnimation(model, anims[0], animFrameCounter);
      if (animFrameCounter >= anims[0].frameCount) animFrameCounter = 0;
    }
    //----------------------------------------------------------------------------------

    // Draw
    //----------------------------------------------------------------------------------
    drawingScope(() {
      clearBackground(Color.rayWhite);

      mode3DScope(camera, () {
        drawModelEx(
          model,
          position,
          Vector3(1.0, 0.0, 0.0),
          -90.0,
          Vector3(1.0, 1.0, 1.0),
          Color.white,
        );

        for (int i = 0; i < model.boneCount; i++) {
          drawCube(
            poses[animFrameCounter][i].translation,
            0.2,
            0.2,
            0.2,
            Color.red,
          );
        }

        drawGrid(10, 1.0); // Draw a grid
      });

      drawText("PRESS SPACE to PLAY MODEL ANIMATION", 10, 10, 20, Color.maroon);
      drawText(
        "(c) Guy IQM 3D model by @culacant",
        screenWidth - 200,
        screenHeight - 20,
        10,
        Color.gray,
      );
    });
    //----------------------------------------------------------------------------------
  }

  // De-Initialization
  //--------------------------------------------------------------------------------------
  texture.dispose(); // Unload texture
  unloadModelAnimations(anims); // Unload model animations data
  model.dispose(); // Unload model

  closeWindow(); // Close window and OpenGL context
  //--------------------------------------------------------------------------------------
}
