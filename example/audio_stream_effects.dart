import 'dart:typed_data';

import 'package:raylib/raylib.dart';

List<double> delayBuffer = [];
int delayBufferSize = 0;
int delayReadIndex = 2;
int delayWriteIndex = 0;

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
    "raylib [audio] example - stream effects",
  );

  initAudioDevice(); // Initialize audio device

  final music = loadMusicStream("./example/resources/country.mp3");

  // Allocate buffer for the delay effect
  delayBufferSize = 48000 * 2; // 1 second delay (device sampleRate*channels)
  delayBuffer = List<double>.filled(delayBufferSize, 0);

  playMusicStream(music);

  double timePlayed = 0.0; // Time played normalized [0.0f..1.0f]
  bool pause = false; // Music playing paused

  bool enableEffectLPF = false; // Enable effect low-pass-filter
  bool enableEffectDelay = false; // Enable effect delay (1 second)

  AudioProcessorToken? lpfToken;
  AudioProcessorToken? delayToken;

  setTargetFPS(60); // Set our game to run at 60 frames-per-second
  //--------------------------------------------------------------------------------------

  // Main game loop
  while (!windowShouldClose()) // Detect window close button or ESC key
  {
    // Update
    //----------------------------------------------------------------------------------
    updateMusicStream(music); // Update music buffer with new stream data

    // Restart music playing (stop and play)
    if (isKeyPressed(KeyboardKey.space)) {
      stopMusicStream(music);
      playMusicStream(music);
    }

    // Pause/Resume music playing
    if (isKeyPressed(KeyboardKey.p)) {
      pause = !pause;

      if (pause) {
        pauseMusicStream(music);
      } else {
        resumeMusicStream(music);
      }
    }

    // Add/Remove effect: lowpass filter
    if (isKeyPressed(KeyboardKey.f)) {
      enableEffectLPF = !enableEffectLPF;
      if (enableEffectLPF) {
        lpfToken =
            attachAudioStreamProcessor(music.stream, audioProcessEffectLPF);
      } else {
        detachAudioStreamProcessor(music.stream, lpfToken!);
        lpfToken = null;
      }
    }

    // Add/Remove effect: delay
    if (isKeyPressed(KeyboardKey.d)) {
      enableEffectDelay = !enableEffectDelay;
      if (enableEffectDelay) {
        delayToken =
            attachAudioStreamProcessor(music.stream, audioProcessEffectDelay);
      } else {
        detachAudioStreamProcessor(music.stream, delayToken!);
        delayToken = null;
      }
    }

    // Get normalized time played for current music stream
    timePlayed = getMusicTimePlayed(music) / getMusicTimeLength(music);

    if (timePlayed > 1.0) {
      timePlayed = 1.0; // Make sure time played is no longer than music
    }
    //----------------------------------------------------------------------------------

    // Draw
    //----------------------------------------------------------------------------------
    drawingScope(() {
      clearBackground(Color.rayWhite);

      drawText("MUSIC SHOULD BE PLAYING!", 245, 150, 20, Color.lightGray);

      drawRectangle(200, 180, 400, 12, Color.lightGray);
      drawRectangle(200, 180, (timePlayed * 400.0).round(), 12, Color.maroon);
      drawRectangleLines(200, 180, 400, 12, Color.gray);

      drawText("PRESS SPACE TO RESTART MUSIC", 215, 230, 20, Color.lightGray);
      drawText("PRESS P TO PAUSE/RESUME MUSIC", 208, 260, 20, Color.lightGray);

      drawText(
        "PRESS F TO TOGGLE LPF EFFECT: ${enableEffectLPF ? "ON" : "OFF"}",
        200,
        320,
        20,
        Color.gray,
      );
      drawText(
        "PRESS D TO TOGGLE DELAY EFFECT: ${enableEffectDelay ? "ON" : "OFF"}",
        180,
        350,
        20,
        Color.gray,
      );
    });
    //----------------------------------------------------------------------------------
  }

  // De-Initialization
  //--------------------------------------------------------------------------------------
  if (lpfToken != null) detachAudioStreamProcessor(music.stream, lpfToken);
  if (delayToken != null) detachAudioStreamProcessor(music.stream, delayToken);

  music.dispose(); // Unload music stream buffers from RAM

  closeAudioDevice(); // Close audio device (music streaming is automatically stopped)

  closeWindow(); // Close window and OpenGL context
  //--------------------------------------------------------------------------------------
}

Float32List audioProcessEffectLPF(Float32List buffer) {
  final low = List<double>.filled(2, 0.0);
  const double cutoff = 70.0 / 44100.0; // 70 Hz lowpass filter
  const double k = cutoff / (cutoff + 0.1591549431); // RC filter formula

  for (int i = 0; i < buffer.length; i += 2) {
    final l = buffer[i];
    final r = buffer[i + 1];
    low[0] += k * (l - low[0]);
    low[1] += k * (r - low[1]);
    buffer[i] = low[0];
    buffer[i + 1] = low[1];
  }

  return buffer;
}

// Audio effect: delay
Float32List audioProcessEffectDelay(Float32List buffer) {
  for (int i = 0; i < buffer.length; i += 2) {
    final leftDelay = delayBuffer[delayReadIndex++];
    final rightDelay = delayBuffer[delayReadIndex++];

    if (delayReadIndex == delayBufferSize) delayReadIndex = 0;

    buffer[i] = 0.5 * buffer[i] + 0.5 * leftDelay;
    buffer[i + 1] = 0.5 * buffer[i + 1] + 0.5 * rightDelay;

    delayBuffer[delayWriteIndex++] = buffer[i];
    delayBuffer[delayWriteIndex++] = buffer[i + 1];
    if (delayWriteIndex == delayBufferSize) delayWriteIndex = 0;
  }

  return buffer;
}
