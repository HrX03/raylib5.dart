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

  final soundArray = <Sound>[];
  int currentSound = 0;

  initWindow(
    screenWidth,
    screenHeight,
    "raylib [audio] example - playing sound multiple times",
  );

  initAudioDevice(); // Initialize audio device

  // load the sound list

  // Load WAV audio file into the first slot as the 'source' sound
  // this sound owns the sample data
  soundArray.add(loadSound("./example/resources/sound.wav"));
  for (int i = 1; i < 10; i++) {
    // Load an alias of the sound into slots 1-9. These do not own the sound data, but can be played
    soundArray.add(loadSoundAlias(soundArray[0]));
  }
  currentSound = 0; // set the sound list to the start

  setTargetFPS(60); // Set our game to run at 60 frames-per-second
  //--------------------------------------------------------------------------------------

  // Main game loop
  while (!windowShouldClose()) // Detect window close button or ESC key
  {
    // Update
    //----------------------------------------------------------------------------------
    if (isKeyPressed(KeyboardKey.space)) {
      playSound(soundArray[currentSound]); // play the next open sound slot
      currentSound++; // increment the sound slot
      // if the sound slot is out of bounds, go back to 0
      if (currentSound >= 10) currentSound = 0;

      // Note: a better way would be to look at the list for the first sound that is not playing and use that slot
    }

    //----------------------------------------------------------------------------------

    // Draw
    //----------------------------------------------------------------------------------
    drawingScope(() {
      clearBackground(Color.rayWhite);

      drawText(
        "Press SPACE to PLAY a WAV sound!",
        200,
        180,
        20,
        Color.lightGray,
      );
    });
    //----------------------------------------------------------------------------------
  }

  // De-Initialization
  //--------------------------------------------------------------------------------------
  for (int i = 1; i < soundArray.length; i++) {
    unloadSoundAlias(soundArray[i]); // Unload sound aliases
  }
  unloadSound(soundArray[0]); // Unload source sound data

  closeAudioDevice(); // Close audio device

  closeWindow(); // Close window and OpenGL context
  //--------------------------------------------------------------------------------------
}
