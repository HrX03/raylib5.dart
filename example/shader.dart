import 'package:raylib/raylib.dart';

const colorsPerPalette = 8;

final List<List<IVector3>> palettes = [
  [
    IVector3(0, 0, 0),
    IVector3(255, 0, 0),
    IVector3(0, 255, 0),
    IVector3(0, 0, 255),
    IVector3(0, 255, 255),
    IVector3(255, 0, 255),
    IVector3(255, 255, 0),
    IVector3(255, 255, 255),
  ],
  [
    IVector3(4, 12, 6),
    IVector3(17, 35, 24),
    IVector3(30, 58, 41),
    IVector3(48, 93, 66),
    IVector3(77, 128, 97),
    IVector3(137, 162, 87),
    IVector3(190, 220, 127),
    IVector3(238, 255, 204),
  ],
  [
    IVector3(21, 25, 26),
    IVector3(138, 76, 88),
    IVector3(217, 98, 117),
    IVector3(230, 184, 193),
    IVector3(69, 107, 115),
    IVector3(75, 151, 166),
    IVector3(165, 189, 194),
    IVector3(255, 245, 247),
  ]
];

const List<String> paletteText = [
  "3-BIT RGB",
  "AMMO-8 (GameBoy-like)",
  "RKBV (2-strip film)",
];

void main() {
  final raylib = RayLib.initWithSources(
    sources: const LibrarySources(windows: "./src/raylib.dll"),
  );

  const int screenWidth = 800;
  const int screenHeight = 450;

  raylib.initWindow(
    screenWidth,
    screenHeight,
    "raylib [shaders] example - color palette switch",
  );

  // Load shader to be used on some parts drawing
  // NOTE 1: Using GLSL 330 shader version, on OpenGL ES 2.0 use GLSL 100 shader version
  // NOTE 2: Defining 0 (NULL) for vertex shader forces usage of internal default vertex shader
  final Shader shader = raylib.loadShader(
    null,
    "./example/resources/palette_switch.fs",
  );

  // Get variable (uniform) location on the shader to connect with the program
  // NOTE: If uniform variable could not be found in the shader, function returns -1
  final int paletteLoc = raylib.getShaderLocation(shader, "palette");

  int currentPalette = 1;
  const int lineHeight = screenHeight ~/ colorsPerPalette;

  raylib.setTargetFPS(60); // Set our game to run at 60 frames-per-second
  //--------------------------------------------------------------------------------------

  // Main game loop
  while (!raylib.windowShouldClose()) // Detect window close button or ESC key
  {
    // Update
    //----------------------------------------------------------------------------------
    if (raylib.isKeyPressed(KeyboardKey.right)) {
      currentPalette++;
    } else if (raylib.isKeyPressed(KeyboardKey.left)) {
      currentPalette--;
    }

    if (currentPalette >= palettes.length) {
      currentPalette = 0;
    } else if (currentPalette < 0) {
      currentPalette = palettes.length - 1;
    }

    // Send new value to the shader to be used on drawing.
    // NOTE: We are sending RGB triplets w/o the alpha channel
    raylib.setShaderValueV(
      shader,
      paletteLoc,
      palettes[currentPalette].toUniformData(),
    );
    //----------------------------------------------------------------------------------

    // Draw
    //----------------------------------------------------------------------------------
    raylib.beginDrawing();

    raylib.clearBackground(Color.rayWhite);

    raylib.beginShaderMode(shader);

    for (int i = 0; i < colorsPerPalette; i++) {
      // Draw horizontal screen-wide rectangles with increasing "palette index"
      // The used palette index is encoded in the RGB components of the pixel
      raylib.drawRectangle(
        0,
        lineHeight * i,
        raylib.getScreenWidth(),
        lineHeight,
        Color(i, i, i, 255),
      );
    }

    raylib.endShaderMode();

    raylib.drawText("< >", 10, 10, 30, Color.darkBlue);
    raylib.drawText("CURRENT PALETTE:", 60, 15, 20, Color.rayWhite);
    raylib.drawText(paletteText[currentPalette], 300, 15, 20, Color.red);

    //raylib.drawFPS(700, 15);

    raylib.endDrawing();
  }

  raylib.unloadShader(shader);
  raylib.closeWindow();
}
