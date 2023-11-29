// GENERATED FILE: DO NOT EDIT
//
// Generated using "dart run ./tool/toplevel_lib_generator.dart generate"

import 'dart:ffi';
import 'dart:typed_data';
import 'package:raylib/raylib.dart';

/* ----- audio/dev_management.dart ----- */
void initAudioDevice() => zoneRayLib.initAudioDevice();

void closeAudioDevice() => zoneRayLib.closeAudioDevice();

bool isAudioDeviceReady() => zoneRayLib.isAudioDeviceReady();

void setMasterVolume(double volume) => zoneRayLib.setMasterVolume(volume);

double getMasterVolume() => zoneRayLib.getMasterVolume();

/* ----- audio/music_management.dart ----- */
Music loadMusicStream(String fileName) => zoneRayLib.loadMusicStream(fileName);

Music loadMusicStreamFromMemory(String fileType, Uint8List data) =>
    zoneRayLib.loadMusicStreamFromMemory(fileType, data);

bool isMusicReady(Music music) => zoneRayLib.isMusicReady(music);

void unloadMusicStream(Music music) => zoneRayLib.unloadMusicStream(music);

void playMusicStream(Music music) => zoneRayLib.playMusicStream(music);

bool isMusicStreamPlaying(Music music) =>
    zoneRayLib.isMusicStreamPlaying(music);

void updateMusicStream(Music music) => zoneRayLib.updateMusicStream(music);

void stopMusicStream(Music music) => zoneRayLib.stopMusicStream(music);

void pauseMusicStream(Music music) => zoneRayLib.pauseMusicStream(music);

void resumeMusicStream(Music music) => zoneRayLib.resumeMusicStream(music);

void seekMusicStream(Music music, double position) =>
    zoneRayLib.seekMusicStream(music, position);

void setMusicVolume(Music music, double volume) =>
    zoneRayLib.setMusicVolume(music, volume);

void setMusicPitch(Music music, double pitch) =>
    zoneRayLib.setMusicPitch(music, pitch);

void setMusicPan(Music music, double pan) => zoneRayLib.setMusicPan(music, pan);

double getMusicTimeLength(Music music) => zoneRayLib.getMusicTimeLength(music);

double getMusicTimePlayed(Music music) => zoneRayLib.getMusicTimePlayed(music);

/* ----- audio/processor.dart ----- */
AudioProcessorToken attachAudioStreamProcessor(
  AudioStream stream,
  FloatAudioCallback processor,
) =>
    zoneRayLib.attachAudioStreamProcessor(stream, processor);

void detachAudioStreamProcessor(
  AudioStream stream,
  AudioProcessorToken token,
) =>
    zoneRayLib.detachAudioStreamProcessor(stream, token);

AudioProcessorToken attachAudioMixedProcessor(FloatAudioCallback processor) =>
    zoneRayLib.attachAudioMixedProcessor(processor);

void detachAudioMixedProcessor(AudioProcessorToken token) =>
    zoneRayLib.detachAudioMixedProcessor(token);

/* ----- audio/stream_management.dart ----- */
AudioStream loadAudioStream(int sampleRate, int sampleSize, int channels) =>
    zoneRayLib.loadAudioStream(sampleRate, sampleSize, channels);

bool isAudioStreamReady(AudioStream stream) =>
    zoneRayLib.isAudioStreamReady(stream);

void unloadAudioStream(AudioStream stream) =>
    zoneRayLib.unloadAudioStream(stream);

void updateAudioStream(AudioStream stream, Uint8List data) =>
    zoneRayLib.updateAudioStream(stream, data);

bool isAudioStreamProcessed(AudioStream stream) =>
    zoneRayLib.isAudioStreamProcessed(stream);

void playAudioStream(AudioStream stream) => zoneRayLib.playAudioStream(stream);

void pauseAudioStream(AudioStream stream) =>
    zoneRayLib.pauseAudioStream(stream);

void resumeAudioStream(AudioStream stream) =>
    zoneRayLib.resumeAudioStream(stream);

bool isAudioStreamPlaying(AudioStream stream) =>
    zoneRayLib.isAudioStreamPlaying(stream);

void stopAudioStream(AudioStream stream) => zoneRayLib.stopAudioStream(stream);

void setAudioStreamVolume(AudioStream stream, double volume) =>
    zoneRayLib.setAudioStreamVolume(stream, volume);

void setAudioStreamPitch(AudioStream stream, double pitch) =>
    zoneRayLib.setAudioStreamPitch(stream, pitch);

void setAudioStreamPan(AudioStream stream, double pan) =>
    zoneRayLib.setAudioStreamPan(stream, pan);

void setAudioStreamBufferSizeDefault(int size) =>
    zoneRayLib.setAudioStreamBufferSizeDefault(size);

void setAudioStreamCallback(AudioStream stream, AudioCallback callback) =>
    zoneRayLib.setAudioStreamCallback(stream, callback);

/* ----- audio/wave_loading.dart ----- */
Wave loadWave(String fileName) => zoneRayLib.loadWave(fileName);

Wave loadWaveFromMemory(String fileType, Uint8List fileData) =>
    zoneRayLib.loadWaveFromMemory(fileType, fileData);

bool isWaveReady(Wave wave) => zoneRayLib.isWaveReady(wave);

Sound loadSound(String fileName) => zoneRayLib.loadSound(fileName);

Sound loadSoundFromWave(Wave wave) => zoneRayLib.loadSoundFromWave(wave);

Sound loadSoundAlias(Sound source) => zoneRayLib.loadSoundAlias(source);

bool isSoundReady(Sound sound) => zoneRayLib.isSoundReady(sound);

void updateSound(Sound sound, Uint8List data, int sampleCount) =>
    zoneRayLib.updateSound(sound, data, sampleCount);

void unloadWave(Wave wave) => zoneRayLib.unloadWave(wave);

void unloadSound(Sound sound) => zoneRayLib.unloadSound(sound);

void unloadSoundAlias(Sound alias) => zoneRayLib.unloadSoundAlias(alias);

bool exportWave(Wave wave, String fileName) =>
    zoneRayLib.exportWave(wave, fileName);

bool exportWaveAsCode(Wave wave, String fileName) =>
    zoneRayLib.exportWaveAsCode(wave, fileName);

/* ----- audio/wave_management.dart ----- */
void playSound(Sound sound) => zoneRayLib.playSound(sound);

void stopSound(Sound sound) => zoneRayLib.stopSound(sound);

void pauseSound(Sound sound) => zoneRayLib.pauseSound(sound);

void resumeSound(Sound sound) => zoneRayLib.resumeSound(sound);

bool isSoundPlaying(Sound sound) => zoneRayLib.isSoundPlaying(sound);

void setSoundVolume(Sound sound, double volume) =>
    zoneRayLib.setSoundVolume(sound, volume);

void setSoundPitch(Sound sound, double pitch) =>
    zoneRayLib.setSoundPitch(sound, pitch);

void setSoundPan(Sound sound, double pan) => zoneRayLib.setSoundPan(sound, pan);

Wave waveCopy(Wave wave) => zoneRayLib.waveCopy(wave);

void waveCrop(Wave wave, int initSample, int finalSample) =>
    zoneRayLib.waveCrop(wave, initSample, finalSample);

void waveFormat(Wave wave, int sampleRate, int sampleSize, int channels) =>
    zoneRayLib.waveFormat(wave, sampleRate, sampleSize, channels);

List<double> loadWaveSamples(Wave wave) => zoneRayLib.loadWaveSamples(wave);

/* ----- core/advanced.dart ----- */
void swapScreenBuffer() => zoneRayLib.swapScreenBuffer();

void pollInputEvents() => zoneRayLib.pollInputEvents();

void waitTime(double seconds) => zoneRayLib.waitTime(seconds);

void setTraceLogCallback(TraceLogCallback callback) =>
    zoneRayLib.setTraceLogCallback(callback);

void setLoadFileDataCallback(LoadFileDataCallback callback) =>
    zoneRayLib.setLoadFileDataCallback(callback);

void setSaveFileDataCallback(SaveFileDataCallback callback) =>
    zoneRayLib.setSaveFileDataCallback(callback);

void setLoadFileTextCallback(LoadFileTextCallback callback) =>
    zoneRayLib.setLoadFileTextCallback(callback);

void setSaveFileTextCallback(SaveFileTextCallback callback) =>
    zoneRayLib.setSaveFileTextCallback(callback);

/* ----- core/automation.dart ----- */
AutomationEventList loadAutomationEventList([String? fileName]) =>
    zoneRayLib.loadAutomationEventList(fileName);

void unloadAutomationEventList(AutomationEventList list) =>
    zoneRayLib.unloadAutomationEventList(list);

bool exportAutomationEventList(AutomationEventList list, String fileName) =>
    zoneRayLib.exportAutomationEventList(list, fileName);

void setAutomationEventList(AutomationEventList list) =>
    zoneRayLib.setAutomationEventList(list);

void setAutomationEventBaseFrame(int frame) =>
    zoneRayLib.setAutomationEventBaseFrame(frame);

void startAutomationEventRecording() =>
    zoneRayLib.startAutomationEventRecording();

void stopAutomationEventRecording() =>
    zoneRayLib.stopAutomationEventRecording();

void playAutomationEvent(AutomationEvent event) =>
    zoneRayLib.playAutomationEvent(event);

/* ----- core/cursor.dart ----- */
void showCursor() => zoneRayLib.showCursor();

void hideCursor() => zoneRayLib.hideCursor();

bool isCursorHidden() => zoneRayLib.isCursorHidden();

void enableCursor() => zoneRayLib.enableCursor();

void disableCursor() => zoneRayLib.disableCursor();

bool isCursorOnScreen() => zoneRayLib.isCursorOnScreen();

/* ----- core/draw.dart ----- */
void clearBackground(Color color) => zoneRayLib.clearBackground(color);

void beginDrawing() => zoneRayLib.beginDrawing();

void endDrawing() => zoneRayLib.endDrawing();

void beginMode2D(Camera2D camera) => zoneRayLib.beginMode2D(camera);

void endMode2D() => zoneRayLib.endMode2D();

void beginMode3D(Camera3D camera) => zoneRayLib.beginMode3D(camera);

void endMode3D() => zoneRayLib.endMode3D();

void beginTextureMode(RenderTexture2D target) =>
    zoneRayLib.beginTextureMode(target);

void endTextureMode() => zoneRayLib.endTextureMode();

void beginShaderMode(Shader shader) => zoneRayLib.beginShaderMode(shader);

void endShaderMode() => zoneRayLib.endShaderMode();

void beginBlendMode(BlendMode mode) => zoneRayLib.beginBlendMode(mode);

void endBlendMode() => zoneRayLib.endBlendMode();

void beginScissorMode(int x, int y, int width, int height) =>
    zoneRayLib.beginScissorMode(x, y, width, height);

void endScissorMode() => zoneRayLib.endScissorMode();

void beginVrStereoMode(VrStereoConfig config) =>
    zoneRayLib.beginVrStereoMode(config);

void endVrStereoMode() => zoneRayLib.endVrStereoMode();

/* ----- core/encoding.dart ----- */
Uint8List compressData(Uint8List data) => zoneRayLib.compressData(data);

Uint8List decompressData(Uint8List compData) =>
    zoneRayLib.decompressData(compData);

Uint8List encodeDataBase64(Uint8List data) => zoneRayLib.encodeDataBase64(data);

Uint8List decodeDataBase64(Uint8List data) => zoneRayLib.decodeDataBase64(data);

/* ----- core/fs.dart ----- */
Uint8List loadFileData(String fileName) => zoneRayLib.loadFileData(fileName);

bool saveFileData(String fileName, Uint8List data) =>
    zoneRayLib.saveFileData(fileName, data);

bool exportDataAsCode(String fileName, Uint8List data) =>
    zoneRayLib.exportDataAsCode(fileName, data);

String loadFileText(String fileName) => zoneRayLib.loadFileText(fileName);

bool saveFileText(String fileName, String text) =>
    zoneRayLib.saveFileText(fileName, text);

bool fileExists(String fileName) => zoneRayLib.fileExists(fileName);

bool directoryExists(String dirPath) => zoneRayLib.directoryExists(dirPath);

bool isFileExtension(String fileName, String ext) =>
    zoneRayLib.isFileExtension(fileName, ext);

int getFileLength(String fileName) => zoneRayLib.getFileLength(fileName);

String getFileExtension(String fileName) =>
    zoneRayLib.getFileExtension(fileName);

String getFileName(String filePath) => zoneRayLib.getFileName(filePath);

String getFileNameWithoutExt(String filePath) =>
    zoneRayLib.getFileNameWithoutExt(filePath);

String getDirectoryPath(String filePath) =>
    zoneRayLib.getDirectoryPath(filePath);

String getPrevDirectoryPath(String dirPath) =>
    zoneRayLib.getPrevDirectoryPath(dirPath);

String getWorkingDirectory() => zoneRayLib.getWorkingDirectory();

String getApplicationDirectory() => zoneRayLib.getApplicationDirectory();

bool isPathFile(String path) => zoneRayLib.isPathFile(path);

List<String> loadDirectoryFiles(String dirPath) =>
    zoneRayLib.loadDirectoryFiles(dirPath);

List<String> loadDirectoryFilesEx(
  String basePath, {
  String? filter,
  bool scanSubdirs = false,
}) =>
    zoneRayLib.loadDirectoryFilesEx(
      basePath,
      filter: filter,
      scanSubdirs: scanSubdirs,
    );

bool isFileDropped() => zoneRayLib.isFileDropped();

List<String> loadDroppedFiles() => zoneRayLib.loadDroppedFiles();

int getFileModTime(String fileName) => zoneRayLib.getFileModTime(fileName);

/* ----- core/gamepad.dart ----- */
bool isGamepadAvailable(int gamepad) => zoneRayLib.isGamepadAvailable(gamepad);

String getGamepadName(int gamepad) => zoneRayLib.getGamepadName(gamepad);

bool isGamepadButtonPressed(int gamepad, GamepadButton button) =>
    zoneRayLib.isGamepadButtonPressed(gamepad, button);

bool isGamepadButtonDown(int gamepad, GamepadButton button) =>
    zoneRayLib.isGamepadButtonDown(gamepad, button);

bool isGamepadButtonReleased(int gamepad, GamepadButton button) =>
    zoneRayLib.isGamepadButtonReleased(gamepad, button);

bool isGamepadButtonUp(int gamepad, GamepadButton button) =>
    zoneRayLib.isGamepadButtonUp(gamepad, button);

GamepadButton getGamepadButtonPressed() => zoneRayLib.getGamepadButtonPressed();

int getGamepadAxisCount(int gamepad) => zoneRayLib.getGamepadAxisCount(gamepad);

double getGamepadAxisMovement(int gamepad, GamepadAxis axis) =>
    zoneRayLib.getGamepadAxisMovement(gamepad, axis);

int setGamepadMappings(String mappings) =>
    zoneRayLib.setGamepadMappings(mappings);

/* ----- core/gestures.dart ----- */
void setGesturesEnabled(Set<Gesture> flags) =>
    zoneRayLib.setGesturesEnabled(flags);

bool isGestureDetected(Gesture gesture) =>
    zoneRayLib.isGestureDetected(gesture);

Gesture getGestureDetected() => zoneRayLib.getGestureDetected();

double getGestureHoldDuration() => zoneRayLib.getGestureHoldDuration();

Vector2 getGestureDragVector() => zoneRayLib.getGestureDragVector();

double getGestureDragAngle() => zoneRayLib.getGestureDragAngle();

Vector2 getGesturePinchVector() => zoneRayLib.getGesturePinchVector();

double getGesturePinchAngle() => zoneRayLib.getGesturePinchAngle();

/* ----- core/keyboard.dart ----- */
bool isKeyPressed(KeyboardKey key) => zoneRayLib.isKeyPressed(key);

bool isKeyPressedRepeat(KeyboardKey key) => zoneRayLib.isKeyPressedRepeat(key);

bool isKeyDown(KeyboardKey key) => zoneRayLib.isKeyDown(key);

bool isKeyReleased(KeyboardKey key) => zoneRayLib.isKeyReleased(key);

bool isKeyUp(KeyboardKey key) => zoneRayLib.isKeyUp(key);

KeyboardKey getKeyPressed() => zoneRayLib.getKeyPressed();

int getCharPressed() => zoneRayLib.getCharPressed();

void setExitKey(KeyboardKey key) => zoneRayLib.setExitKey(key);

/* ----- core/misc.dart ----- */
void takeScreenshot(String fileName) => zoneRayLib.takeScreenshot(fileName);

void setConfigFlags(Set<ConfigFlag> flags) => zoneRayLib.setConfigFlags(flags);

void openURL(String url) => zoneRayLib.openURL(url);

/* ----- core/mouse.dart ----- */
bool isMouseButtonPressed(MouseButton button) =>
    zoneRayLib.isMouseButtonPressed(button);

bool isMouseButtonDown(MouseButton button) =>
    zoneRayLib.isMouseButtonDown(button);

bool isMouseButtonReleased(MouseButton button) =>
    zoneRayLib.isMouseButtonReleased(button);

bool isMouseButtonUp(MouseButton button) => zoneRayLib.isMouseButtonUp(button);

int getMouseX() => zoneRayLib.getMouseX();

int getMouseY() => zoneRayLib.getMouseY();

Vector2 getMousePosition() => zoneRayLib.getMousePosition();

Vector2 getMouseDelta() => zoneRayLib.getMouseDelta();

void setMousePosition(int x, int y) => zoneRayLib.setMousePosition(x, y);

void setMouseOffset(int offsetX, int offsetY) =>
    zoneRayLib.setMouseOffset(offsetX, offsetY);

void setMouseScale(double scaleX, double scaleY) =>
    zoneRayLib.setMouseScale(scaleX, scaleY);

double getMouseWheelMove() => zoneRayLib.getMouseWheelMove();

Vector2 getMouseWheelMoveV() => zoneRayLib.getMouseWheelMoveV();

void setMouseCursor(MouseCursor cursor) => zoneRayLib.setMouseCursor(cursor);

/* ----- core/random.dart ----- */
void setRandomSeed(int seed) => zoneRayLib.setRandomSeed(seed);

int getRandomValue(int min, int max) => zoneRayLib.getRandomValue(min, max);

List<int> loadRandomSequence(int count, int min, int max) =>
    zoneRayLib.loadRandomSequence(count, min, max);

/* ----- core/screen_space.dart ----- */
Ray getMouseRay(Vector2 mousePosition, Camera camera) =>
    zoneRayLib.getMouseRay(mousePosition, camera);

Matrix getCameraMatrix(Camera camera) => zoneRayLib.getCameraMatrix(camera);

Matrix getCameraMatrix2D(Camera2D camera) =>
    zoneRayLib.getCameraMatrix2D(camera);

Vector2 getWorldToScreen(Vector3 position, Camera camera) =>
    zoneRayLib.getWorldToScreen(position, camera);

Vector2 getScreenToWorld2D(Vector2 position, Camera2D camera) =>
    zoneRayLib.getScreenToWorld2D(position, camera);

Vector2 getWorldToScreenEx(
  Vector3 position,
  Camera camera,
  int width,
  int height,
) =>
    zoneRayLib.getWorldToScreenEx(position, camera, width, height);

Vector2 getWorldToScreen2D(Vector2 position, Camera2D camera) =>
    zoneRayLib.getWorldToScreen2D(position, camera);

/* ----- core/shader.dart ----- */
Shader loadShader(String? vsFileName, String? fsFileName) =>
    zoneRayLib.loadShader(vsFileName, fsFileName);

Shader loadShaderFromMemory(String? vsCode, String? fsCode) =>
    zoneRayLib.loadShaderFromMemory(vsCode, fsCode);

bool isShaderReady(Shader shader) => zoneRayLib.isShaderReady(shader);

int getShaderLocation(Shader shader, String uniformName) =>
    zoneRayLib.getShaderLocation(shader, uniformName);

int getShaderLocationAttrib(Shader shader, String attribName) =>
    zoneRayLib.getShaderLocationAttrib(shader, attribName);

void setShaderValue(
  Shader shader,
  int locIndex,
  UniformValue<dynamic, NativeType> value,
) =>
    zoneRayLib.setShaderValue(shader, locIndex, value);

void setShaderValueV(
  Shader shader,
  int locIndex,
  List<UniformValue<dynamic, NativeType>> value,
) =>
    zoneRayLib.setShaderValueV(shader, locIndex, value);

void setShaderValueMatrix(Shader shader, int locIndex, Matrix mat) =>
    zoneRayLib.setShaderValueMatrix(shader, locIndex, mat);

void setShaderValueTexture(Shader shader, int locIndex, Texture2D texture) =>
    zoneRayLib.setShaderValueTexture(shader, locIndex, texture);

void unloadShader(Shader shader) => zoneRayLib.unloadShader(shader);

/* ----- core/timings.dart ----- */
void setTargetFPS(int fps) => zoneRayLib.setTargetFPS(fps);

double getFrameTime() => zoneRayLib.getFrameTime();

double getTime() => zoneRayLib.getTime();

int getFPS() => zoneRayLib.getFPS();

/* ----- core/touch.dart ----- */
int getTouchX() => zoneRayLib.getTouchX();

int getTouchY() => zoneRayLib.getTouchY();

Vector2 getTouchPosition(int index) => zoneRayLib.getTouchPosition(index);

int getTouchPointId(int index) => zoneRayLib.getTouchPointId(index);

int getTouchPointCount() => zoneRayLib.getTouchPointCount();

/* ----- core/utils.dart ----- */
void traceLog(LogLevel logLevel, String text) =>
    zoneRayLib.traceLog(logLevel, text);

void setTraceLogLevel(LogLevel logLevel) =>
    zoneRayLib.setTraceLogLevel(logLevel);

/* ----- core/vr.dart ----- */
VrStereoConfig loadVrStereoConfig(VrDeviceInfo device) =>
    zoneRayLib.loadVrStereoConfig(device);

void unloadVrStereoConfig(VrStereoConfig config) =>
    zoneRayLib.unloadVrStereoConfig(config);

/* ----- core/window.dart ----- */
void initWindow(int width, int height, String title) =>
    zoneRayLib.initWindow(width, height, title);

void closeWindow() => zoneRayLib.closeWindow();

bool windowShouldClose() => zoneRayLib.windowShouldClose();

bool isWindowReady() => zoneRayLib.isWindowReady();

bool isWindowFullscreen() => zoneRayLib.isWindowFullscreen();

bool isWindowHidden() => zoneRayLib.isWindowHidden();

bool isWindowMinimized() => zoneRayLib.isWindowMinimized();

bool isWindowMaximized() => zoneRayLib.isWindowMaximized();

bool isWindowFocused() => zoneRayLib.isWindowFocused();

bool isWindowResized() => zoneRayLib.isWindowResized();

bool isWindowState(ConfigFlag flag) => zoneRayLib.isWindowState(flag);

void setWindowState(Set<ConfigFlag> flags) => zoneRayLib.setWindowState(flags);

void clearWindowState(Set<ConfigFlag> flags) =>
    zoneRayLib.clearWindowState(flags);

void toggleFullscreen() => zoneRayLib.toggleFullscreen();

void toggleBorderlessWindowed() => zoneRayLib.toggleBorderlessWindowed();

void maximizeWindow() => zoneRayLib.maximizeWindow();

void minimizeWindow() => zoneRayLib.minimizeWindow();

void restoreWindow() => zoneRayLib.restoreWindow();

void setWindowIcon(Image image) => zoneRayLib.setWindowIcon(image);

void setWindowIcons(List<Image> images) => zoneRayLib.setWindowIcons(images);

void setWindowTitle(String title) => zoneRayLib.setWindowTitle(title);

void setWindowPosition(int x, int y) => zoneRayLib.setWindowPosition(x, y);

void setWindowMonitor(int monitor) => zoneRayLib.setWindowMonitor(monitor);

void setWindowMinSize(int width, int height) =>
    zoneRayLib.setWindowMinSize(width, height);

void setWindowMaxSize(int width, int height) =>
    zoneRayLib.setWindowMaxSize(width, height);

void setWindowSize(int width, int height) =>
    zoneRayLib.setWindowSize(width, height);

void setWindowOpacity(double opacity) => zoneRayLib.setWindowOpacity(opacity);

void setWindowFocused() => zoneRayLib.setWindowFocused();

Pointer<Void> getWindowHandle() => zoneRayLib.getWindowHandle();

int getScreenWidth() => zoneRayLib.getScreenWidth();

int getScreenHeight() => zoneRayLib.getScreenHeight();

int getRenderWidth() => zoneRayLib.getRenderWidth();

int getRenderHeight() => zoneRayLib.getRenderHeight();

int getMonitorCount() => zoneRayLib.getMonitorCount();

int getCurrentMonitor() => zoneRayLib.getCurrentMonitor();

Vector2 getMonitorPosition(int monitor) =>
    zoneRayLib.getMonitorPosition(monitor);

int getMonitorWidth(int monitor) => zoneRayLib.getMonitorWidth(monitor);

int getMonitorHeight(int monitor) => zoneRayLib.getMonitorHeight(monitor);

int getMonitorPhysicalWidth(int monitor) =>
    zoneRayLib.getMonitorPhysicalWidth(monitor);

int getMonitorPhysicalHeight(int monitor) =>
    zoneRayLib.getMonitorPhysicalHeight(monitor);

int getMonitorRefreshRate(int monitor) =>
    zoneRayLib.getMonitorRefreshRate(monitor);

Vector2 getWindowPosition() => zoneRayLib.getWindowPosition();

Vector2 getWindowScaleDPI() => zoneRayLib.getWindowScaleDPI();

String getMonitorName(int monitor) => zoneRayLib.getMonitorName(monitor);

void setClipboardText(String text) => zoneRayLib.setClipboardText(text);

String getClipboardText() => zoneRayLib.getClipboardText();

void enableEventWaiting() => zoneRayLib.enableEventWaiting();

void disableEventWaiting() => zoneRayLib.disableEventWaiting();

/* ----- managed/managed.dart ----- */
void drawingScope(void Function() scope) => zoneRayLib.drawingScope(scope);

void mode2DScope(Camera2D camera, void Function() scope) =>
    zoneRayLib.mode2DScope(camera, scope);

void mode3DScope(Camera3D camera, void Function() scope) =>
    zoneRayLib.mode3DScope(camera, scope);

void textureModeScope(RenderTexture2D texture, void Function() scope) =>
    zoneRayLib.textureModeScope(texture, scope);

void shaderModeScope(Shader shader, void Function() scope) =>
    zoneRayLib.shaderModeScope(shader, scope);

void blendModeScope(BlendMode blendMode, void Function() scope) =>
    zoneRayLib.blendModeScope(blendMode, scope);

void scissorModeScope(
  int x,
  int y,
  int width,
  int height,
  void Function() scope,
) =>
    zoneRayLib.scissorModeScope(x, y, width, height, scope);

void vrStereoModeScope(VrStereoConfig config, void Function() scope) =>
    zoneRayLib.vrStereoModeScope(config, scope);

/* ----- shapes/basic.dart ----- */
void setShapesTexture(Texture2D texture, Rectangle source) =>
    zoneRayLib.setShapesTexture(texture, source);

void drawPixel(int posX, int posY, Color color) =>
    zoneRayLib.drawPixel(posX, posY, color);

void drawPixelV(Vector2 pos, Color color) => zoneRayLib.drawPixelV(pos, color);

void drawLine(
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  Color color,
) =>
    zoneRayLib.drawLine(startPosX, startPosY, endPosX, endPosY, color);

void drawLineV(Vector2 startPos, Vector2 endPos, Color color) =>
    zoneRayLib.drawLineV(startPos, endPos, color);

void drawLineEx(Vector2 startPos, Vector2 endPos, double thick, Color color) =>
    zoneRayLib.drawLineEx(startPos, endPos, thick, color);

void drawLineStrip(List<Vector2> points, Color color) =>
    zoneRayLib.drawLineStrip(points, color);

void drawLineBezier(
  Vector2 startPos,
  Vector2 endPos,
  double thick,
  Color color,
) =>
    zoneRayLib.drawLineBezier(startPos, endPos, thick, color);

void drawCircle(int centerX, int centerY, double radius, Color color) =>
    zoneRayLib.drawCircle(centerX, centerY, radius, color);

void drawCircleSector(
  Vector2 center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) =>
    zoneRayLib.drawCircleSector(
      center,
      radius,
      startAngle,
      endAngle,
      segments,
      color,
    );

void drawCircleSectorLines(
  Vector2 center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) =>
    zoneRayLib.drawCircleSectorLines(
      center,
      radius,
      startAngle,
      endAngle,
      segments,
      color,
    );

void drawCircleGradient(
  int centerX,
  int centerY,
  double radius,
  Color color1,
  Color color2,
) =>
    zoneRayLib.drawCircleGradient(centerX, centerY, radius, color1, color2);

void drawCircleV(Vector2 center, double radius, Color color) =>
    zoneRayLib.drawCircleV(center, radius, color);

void drawCircleLines(int centerX, int centerY, double radius, Color color) =>
    zoneRayLib.drawCircleLines(centerX, centerY, radius, color);

void drawCircleLinesV(Vector2 center, double radius, Color color) =>
    zoneRayLib.drawCircleLinesV(center, radius, color);

void drawEllipse(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  Color color,
) =>
    zoneRayLib.drawEllipse(centerX, centerY, radiusH, radiusV, color);

void drawEllipseLines(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  Color color,
) =>
    zoneRayLib.drawEllipseLines(centerX, centerY, radiusH, radiusV, color);

void drawRing(
  Vector2 center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) =>
    zoneRayLib.drawRing(
      center,
      innerRadius,
      outerRadius,
      startAngle,
      endAngle,
      segments,
      color,
    );

void drawRingLines(
  Vector2 center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  Color color,
) =>
    zoneRayLib.drawRingLines(
      center,
      innerRadius,
      outerRadius,
      startAngle,
      endAngle,
      segments,
      color,
    );

void drawRectangle(int posX, int posY, int width, int height, Color color) =>
    zoneRayLib.drawRectangle(posX, posY, width, height, color);

void drawRectangleV(Vector2 position, Vector2 size, Color color) =>
    zoneRayLib.drawRectangleV(position, size, color);

void drawRectangleRec(Rectangle rec, Color color) =>
    zoneRayLib.drawRectangleRec(rec, color);

void drawRectanglePro(
  Rectangle rec,
  Vector2 origin,
  double rotation,
  Color color,
) =>
    zoneRayLib.drawRectanglePro(rec, origin, rotation, color);

void drawRectangleGradientV(
  int posX,
  int posY,
  int width,
  int height,
  Color color1,
  Color color2,
) =>
    zoneRayLib.drawRectangleGradientV(
      posX,
      posY,
      width,
      height,
      color1,
      color2,
    );

void drawRectangleGradientH(
  int posX,
  int posY,
  int width,
  int height,
  Color color1,
  Color color2,
) =>
    zoneRayLib.drawRectangleGradientH(
      posX,
      posY,
      width,
      height,
      color1,
      color2,
    );

void drawRectangleGradientEx(
  Rectangle rec,
  Color col1,
  Color col2,
  Color col3,
  Color col4,
) =>
    zoneRayLib.drawRectangleGradientEx(rec, col1, col2, col3, col4);

void drawRectangleLines(
  int posX,
  int posY,
  int width,
  int height,
  Color color,
) =>
    zoneRayLib.drawRectangleLines(posX, posY, width, height, color);

void drawRectangleLinesEx(Rectangle rec, double lineThick, Color color) =>
    zoneRayLib.drawRectangleLinesEx(rec, lineThick, color);

void drawRectangleRounded(
  Rectangle rec,
  double roundness,
  int segments,
  Color color,
) =>
    zoneRayLib.drawRectangleRounded(rec, roundness, segments, color);

void drawRectangleRoundedLines(
  Rectangle rec,
  double roundness,
  int segments,
  double lineThick,
  Color color,
) =>
    zoneRayLib.drawRectangleRoundedLines(
      rec,
      roundness,
      segments,
      lineThick,
      color,
    );

void drawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color) =>
    zoneRayLib.drawTriangle(v1, v2, v3, color);

void drawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color) =>
    zoneRayLib.drawTriangleLines(v1, v2, v3, color);

void drawTriangleFan(List<Vector2> points, Color color) =>
    zoneRayLib.drawTriangleFan(points, color);

void drawTriangleStrip(List<Vector2> points, Color color) =>
    zoneRayLib.drawTriangleStrip(points, color);

void drawPoly(
  Vector2 center,
  int sides,
  double radius,
  double rotation,
  Color color,
) =>
    zoneRayLib.drawPoly(center, sides, radius, rotation, color);

void drawPolyLines(
  Vector2 center,
  int sides,
  double radius,
  double rotation,
  Color color,
) =>
    zoneRayLib.drawPolyLines(center, sides, radius, rotation, color);

void drawPolyLinesEx(
  Vector2 center,
  int sides,
  double radius,
  double rotation,
  double lineThick,
  Color color,
) =>
    zoneRayLib.drawPolyLinesEx(
      center,
      sides,
      radius,
      rotation,
      lineThick,
      color,
    );

/* ----- shapes/collision.dart ----- */
bool checkCollisionRecs(Rectangle rec1, Rectangle rec2) =>
    zoneRayLib.checkCollisionRecs(rec1, rec2);

bool checkCollisionCircles(
  Vector2 center1,
  double radius1,
  Vector2 center2,
  double radius2,
) =>
    zoneRayLib.checkCollisionCircles(center1, radius1, center2, radius2);

bool checkCollisionCircleRec(Vector2 center, double radius, Rectangle rec) =>
    zoneRayLib.checkCollisionCircleRec(center, radius, rec);

bool checkCollisionPointRec(Vector2 point, Rectangle rec) =>
    zoneRayLib.checkCollisionPointRec(point, rec);

bool checkCollisionPointCircle(Vector2 point, Vector2 center, double radius) =>
    zoneRayLib.checkCollisionPointCircle(point, center, radius);

bool checkCollisionPointTriangle(
  Vector2 point,
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
) =>
    zoneRayLib.checkCollisionPointTriangle(point, p1, p2, p3);

bool checkCollisionPointPoly(Vector2 point, List<Vector2> points) =>
    zoneRayLib.checkCollisionPointPoly(point, points);

LineCollisionResult checkCollisionLines(
  Vector2 startPos1,
  Vector2 endPos1,
  Vector2 startPos2,
  Vector2 endPos2,
) =>
    zoneRayLib.checkCollisionLines(startPos1, endPos1, startPos2, endPos2);

bool checkCollisionPointLine(
  Vector2 point,
  Vector2 p1,
  Vector2 p2,
  int threshold,
) =>
    zoneRayLib.checkCollisionPointLine(point, p1, p2, threshold);

Rectangle getCollisionRec(Rectangle rec1, Rectangle rec2) =>
    zoneRayLib.getCollisionRec(rec1, rec2);

/* ----- shapes/splines.dart ----- */
void drawSplineLinear(List<Vector2> points, double thick, Color color) =>
    zoneRayLib.drawSplineLinear(points, thick, color);

void drawSplineBasis(List<Vector2> points, double thick, Color color) =>
    zoneRayLib.drawSplineBasis(points, thick, color);

void drawSplineCatmullRom(List<Vector2> points, double thick, Color color) =>
    zoneRayLib.drawSplineCatmullRom(points, thick, color);

void drawSplineBezierQuadratic(
  List<Vector2> points,
  double thick,
  Color color,
) =>
    zoneRayLib.drawSplineBezierQuadratic(points, thick, color);

void drawSplineBezierCubic(List<Vector2> points, double thick, Color color) =>
    zoneRayLib.drawSplineBezierCubic(points, thick, color);

void drawSplineSegmentLinear(
  Vector2 p1,
  Vector2 p2,
  double thick,
  Color color,
) =>
    zoneRayLib.drawSplineSegmentLinear(p1, p2, thick, color);

void drawSplineSegmentBasis(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double thick,
  Color color,
) =>
    zoneRayLib.drawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

void drawSplineSegmentCatmullRom(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double thick,
  Color color,
) =>
    zoneRayLib.drawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

void drawSplineSegmentBezierQuadratic(
  Vector2 p1,
  Vector2 c2,
  Vector2 p3,
  double thick,
  Color color,
) =>
    zoneRayLib.drawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

void drawSplineSegmentBezierCubic(
  Vector2 p1,
  Vector2 c2,
  Vector2 c3,
  Vector2 p4,
  double thick,
  Color color,
) =>
    zoneRayLib.drawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/* ----- shapes/spline_eval.dart ----- */
Vector2 getSplinePointLinear(Vector2 startPos, Vector2 endPos, double t) =>
    zoneRayLib.getSplinePointLinear(startPos, endPos, t);

Vector2 getSplinePointBasis(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double t,
) =>
    zoneRayLib.getSplinePointBasis(p1, p2, p3, p4, t);

Vector2 getSplinePointCatmullRom(
  Vector2 p1,
  Vector2 p2,
  Vector2 p3,
  Vector2 p4,
  double t,
) =>
    zoneRayLib.getSplinePointCatmullRom(p1, p2, p3, p4, t);

Vector2 getSplinePointBezierQuad(
  Vector2 p1,
  Vector2 c2,
  Vector2 p3,
  double t,
) =>
    zoneRayLib.getSplinePointBezierQuad(p1, c2, p3, t);

Vector2 getSplinePointBezierCubic(
  Vector2 p1,
  Vector2 c2,
  Vector2 c3,
  Vector2 p4,
  double t,
) =>
    zoneRayLib.getSplinePointBezierCubic(p1, c2, c3, p4, t);

/* ----- text/drawing.dart ----- */
void drawFPS(int posX, int posY) => zoneRayLib.drawFPS(posX, posY);

void drawText(String text, int x, int y, int fontSize, Color color) =>
    zoneRayLib.drawText(text, x, y, fontSize, color);

void drawTextEx(
  Font font,
  String text,
  Vector2 position,
  double fontSize,
  double spacing,
  Color tint,
) =>
    zoneRayLib.drawTextEx(font, text, position, fontSize, spacing, tint);

void drawTextPro(
  Font font,
  String text,
  Vector2 position,
  Vector2 origin,
  double rotation,
  double fontSize,
  double spacing,
  Color tint,
) =>
    zoneRayLib.drawTextPro(
      font,
      text,
      position,
      origin,
      rotation,
      fontSize,
      spacing,
      tint,
    );

void drawTextCodepoint(
  Font font,
  int codepoint,
  Vector2 position,
  double fontSize,
  Color tint,
) =>
    zoneRayLib.drawTextCodepoint(font, codepoint, position, fontSize, tint);

void drawTextCodepoints(
  Font font,
  List<int> codepoints,
  Vector2 position,
  double fontSize,
  double spacing,
  Color tint,
) =>
    zoneRayLib.drawTextCodepoints(
      font,
      codepoints,
      position,
      fontSize,
      spacing,
      tint,
    );

/* ----- text/info.dart ----- */
void setTextLineSpacing(int spacing) => zoneRayLib.setTextLineSpacing(spacing);

int measureText(String text, int fontSize) =>
    zoneRayLib.measureText(text, fontSize);

Vector2 measureTextEx(
  Font font,
  String text,
  double fontSize,
  double spacing,
) =>
    zoneRayLib.measureTextEx(font, text, fontSize, spacing);

int getGlyphIndex(Font font, int codepoint) =>
    zoneRayLib.getGlyphIndex(font, codepoint);

GlyphInfo getGlyphInfo(Font font, int codepoint) =>
    zoneRayLib.getGlyphInfo(font, codepoint);

Rectangle getGlyphAtlasRec(Font font, int codepoint) =>
    zoneRayLib.getGlyphAtlasRec(font, codepoint);

/* ----- text/loading.dart ----- */
Font getFontDefault() => zoneRayLib.getFontDefault();

Font loadFont(String fileName) => zoneRayLib.loadFont(fileName);

Font loadFontEx(String fileName, int fontSize, [List<int>? codepoints]) =>
    zoneRayLib.loadFontEx(fileName, fontSize, codepoints);

Font loadFontFromImage(Image image, Color key, int firstChar) =>
    zoneRayLib.loadFontFromImage(image, key, firstChar);

Font loadFontFromMemory(
  String fileType,
  Uint8List fileData,
  int fontSize, [
  List<int>? codepoints,
]) =>
    zoneRayLib.loadFontFromMemory(fileType, fileData, fontSize, codepoints);

bool isFontReady(Font font) => zoneRayLib.isFontReady(font);

List<GlyphInfo> loadFontData(
  Uint8List fileData,
  int fontSize,
  List<int>? codepoints,
  FontType type,
) =>
    zoneRayLib.loadFontData(fileData, fontSize, codepoints, type);

Image genImageFontAtlas(
  List<GlyphInfo> glyphs,
  List<Rectangle> glyphRecs,
  int fontSize,
  int padding,
  FontAtlasPackingMode packMethod,
) =>
    zoneRayLib.genImageFontAtlas(
      glyphs,
      glyphRecs,
      fontSize,
      padding,
      packMethod,
    );

void unloadFont(Font font) => zoneRayLib.unloadFont(font);

bool exportFontAsCode(Font font, String fileName) =>
    zoneRayLib.exportFontAsCode(font, fileName);

/* ----- textures/color.dart ----- */
Color fade(Color color, double alpha) => zoneRayLib.fade(color, alpha);

int colorToInt(Color color) => zoneRayLib.colorToInt(color);

Vector4 colorNormalize(Color color) => zoneRayLib.colorNormalize(color);

Color colorFromNormalized(Vector4 normalized) =>
    zoneRayLib.colorFromNormalized(normalized);

Vector3 colorToHSV(Color color) => zoneRayLib.colorToHSV(color);

Color colorFromHSV(double hue, double saturation, double value) =>
    zoneRayLib.colorFromHSV(hue, saturation, value);

Color colorTint(Color color, Color tint) => zoneRayLib.colorTint(color, tint);

Color colorBrightness(Color color, double factor) =>
    zoneRayLib.colorBrightness(color, factor);

Color colorContrast(Color color, double contrast) =>
    zoneRayLib.colorContrast(color, contrast);

Color colorAlpha(Color color, double alpha) =>
    zoneRayLib.colorAlpha(color, alpha);

Color colorAlphaBlend(Color dst, Color src, Color tint) =>
    zoneRayLib.colorAlphaBlend(dst, src, tint);

Color getColor(int hexValue) => zoneRayLib.getColor(hexValue);

Color getPixelColor(int srcByte, PixelFormat format) =>
    zoneRayLib.getPixelColor(srcByte, format);

int getPixelDataSize(int width, int height, PixelFormat format) =>
    zoneRayLib.getPixelDataSize(width, height, format);

/* ----- textures/image_drawing.dart ----- */
void imageClearBackground(Image dst, Color color) =>
    zoneRayLib.imageClearBackground(dst, color);

void imageDrawPixel(Image dst, int posX, int posY, Color color) =>
    zoneRayLib.imageDrawPixel(dst, posX, posY, color);

void imageDrawPixelV(Image dst, Vector2 position, Color color) =>
    zoneRayLib.imageDrawPixelV(dst, position, color);

void imageDrawLine(
  Image dst,
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  Color color,
) =>
    zoneRayLib.imageDrawLine(
      dst,
      startPosX,
      startPosY,
      endPosX,
      endPosY,
      color,
    );

void imageDrawLineV(Image dst, Vector2 start, Vector2 end, Color color) =>
    zoneRayLib.imageDrawLineV(dst, start, end, color);

void imageDrawCircle(
  Image dst,
  int centerX,
  int centerY,
  int radius,
  Color color,
) =>
    zoneRayLib.imageDrawCircle(dst, centerX, centerY, radius, color);

void imageDrawCircleV(Image dst, Vector2 center, int radius, Color color) =>
    zoneRayLib.imageDrawCircleV(dst, center, radius, color);

void imageDrawCircleLines(
  Image dst,
  int centerX,
  int centerY,
  int radius,
  Color color,
) =>
    zoneRayLib.imageDrawCircleLines(dst, centerX, centerY, radius, color);

void imageDrawCircleLinesV(
  Image dst,
  Vector2 center,
  int radius,
  Color color,
) =>
    zoneRayLib.imageDrawCircleLinesV(dst, center, radius, color);

void imageDrawRectangle(
  Image dst,
  int posX,
  int posY,
  int width,
  int height,
  Color color,
) =>
    zoneRayLib.imageDrawRectangle(dst, posX, posY, width, height, color);

void imageDrawRectangleV(
  Image dst,
  Vector2 position,
  Vector2 size,
  Color color,
) =>
    zoneRayLib.imageDrawRectangleV(dst, position, size, color);

void imageDrawRectangleRec(Image dst, Rectangle rec, Color color) =>
    zoneRayLib.imageDrawRectangleRec(dst, rec, color);

void imageDrawRectangleLines(
  Image dst,
  Rectangle rec,
  int thick,
  Color color,
) =>
    zoneRayLib.imageDrawRectangleLines(dst, rec, thick, color);

void imageDraw(
  Image dst,
  Image src,
  Rectangle srcRec,
  Rectangle dstRec,
  Color tint,
) =>
    zoneRayLib.imageDraw(dst, src, srcRec, dstRec, tint);

void imageDrawText(
  Image dst,
  String text,
  int posX,
  int posY,
  int fontSize,
  Color color,
) =>
    zoneRayLib.imageDrawText(dst, text, posX, posY, fontSize, color);

void imageDrawTextEx(
  Image dst,
  Font font,
  String text,
  Vector2 position,
  double fontSize,
  double spacing,
  Color tint,
) =>
    zoneRayLib.imageDrawTextEx(
      dst,
      font,
      text,
      position,
      fontSize,
      spacing,
      tint,
    );

/* ----- textures/image_generation.dart ----- */
Image genImageColor(int width, int height, Color color) =>
    zoneRayLib.genImageColor(width, height, color);

Image genImageGradientLinear(
  int width,
  int height,
  int direction,
  Color start,
  Color end,
) =>
    zoneRayLib.genImageGradientLinear(width, height, direction, start, end);

Image genImageGradientRadial(
  int width,
  int height,
  double density,
  Color inner,
  Color outer,
) =>
    zoneRayLib.genImageGradientRadial(width, height, density, inner, outer);

Image genImageGradientSquare(
  int width,
  int height,
  double density,
  Color inner,
  Color outer,
) =>
    zoneRayLib.genImageGradientSquare(width, height, density, inner, outer);

Image genImageChecked(
  int width,
  int height,
  int checksX,
  int checksY,
  Color col1,
  Color col2,
) =>
    zoneRayLib.genImageChecked(width, height, checksX, checksY, col1, col2);

Image genImageWhiteNoise(int width, int height, double factor) =>
    zoneRayLib.genImageWhiteNoise(width, height, factor);

Image genImagePerlinNoise(
  int width,
  int height,
  int offsetX,
  int offsetY,
  double scale,
) =>
    zoneRayLib.genImagePerlinNoise(width, height, offsetX, offsetY, scale);

Image genImageCellular(int width, int height, int tileSize) =>
    zoneRayLib.genImageCellular(width, height, tileSize);

Image genImageText(int width, int height, String text) =>
    zoneRayLib.genImageText(width, height, text);

/* ----- textures/image_loading.dart ----- */
Image loadImage(String fileName) => zoneRayLib.loadImage(fileName);

Image loadImageRaw(
  String fileName,
  int width,
  int height,
  PixelFormat format,
  int headerSize,
) =>
    zoneRayLib.loadImageRaw(fileName, width, height, format, headerSize);

Image loadImageSvg(String fileNameOrString, int width, int height) =>
    zoneRayLib.loadImageSvg(fileNameOrString, width, height);

ImageSequence loadImageAnim(String fileName) =>
    zoneRayLib.loadImageAnim(fileName);

Image loadImageFromMemory(String fileType, Uint8List fileData) =>
    zoneRayLib.loadImageFromMemory(fileType, fileData);

Image loadImageFromTexture(Texture2D texture) =>
    zoneRayLib.loadImageFromTexture(texture);

Image loadImageFromScreen() => zoneRayLib.loadImageFromScreen();

bool isImageReady(Image image) => zoneRayLib.isImageReady(image);

void unloadImage(Image image) => zoneRayLib.unloadImage(image);

bool exportImage(Image image, String fileName) =>
    zoneRayLib.exportImage(image, fileName);

Uint8List exportImageToMemory(Image image, String fileType) =>
    zoneRayLib.exportImageToMemory(image, fileType);

bool exportImageAsCode(Image image, String fileName) =>
    zoneRayLib.exportImageAsCode(image, fileName);

/* ----- textures/image_manipulation.dart ----- */
Image imageCopy(Image image) => zoneRayLib.imageCopy(image);

Image imageFromImage(Image image, Rectangle rec) =>
    zoneRayLib.imageFromImage(image, rec);

Image imageText(String text, int fontSize, Color color) =>
    zoneRayLib.imageText(text, fontSize, color);

Image imageTextEx(
  Font font,
  String text,
  double fontSize,
  double spacing,
  Color tint,
) =>
    zoneRayLib.imageTextEx(font, text, fontSize, spacing, tint);

void imageFormat(Image image, PixelFormat newFormat) =>
    zoneRayLib.imageFormat(image, newFormat);

void imageToPOT(Image image, Color fill) => zoneRayLib.imageToPOT(image, fill);

void imageCrop(Image image, Rectangle crop) =>
    zoneRayLib.imageCrop(image, crop);

void imageAlphaCrop(Image image, double threshold) =>
    zoneRayLib.imageAlphaCrop(image, threshold);

void imageAlphaClear(Image image, Color color, double threshold) =>
    zoneRayLib.imageAlphaClear(image, color, threshold);

void imageAlphaMask(Image image, Image alphaMask) =>
    zoneRayLib.imageAlphaMask(image, alphaMask);

void imageAlphaPremultiply(Image image) =>
    zoneRayLib.imageAlphaPremultiply(image);

void imageBlurGaussian(Image image, int blurSize) =>
    zoneRayLib.imageBlurGaussian(image, blurSize);

void imageResize(Image image, int newWidth, int newHeight) =>
    zoneRayLib.imageResize(image, newWidth, newHeight);

void imageResizeNN(Image image, int newWidth, int newHeight) =>
    zoneRayLib.imageResizeNN(image, newWidth, newHeight);

void imageResizeCanvas(
  Image image,
  int newWidth,
  int newHeight,
  int offsetX,
  int offsetY,
  Color fill,
) =>
    zoneRayLib.imageResizeCanvas(
      image,
      newWidth,
      newHeight,
      offsetX,
      offsetY,
      fill,
    );

void imageMipmaps(Image image) => zoneRayLib.imageMipmaps(image);

void imageDither(Image image, int rBpp, int gBpp, int bBpp, int aBpp) =>
    zoneRayLib.imageDither(image, rBpp, gBpp, bBpp, aBpp);

void imageFlipVertical(Image image) => zoneRayLib.imageFlipVertical(image);

void imageFlipHorizontal(Image image) => zoneRayLib.imageFlipHorizontal(image);

void imageRotate(Image image, int degrees) =>
    zoneRayLib.imageRotate(image, degrees);

void imageRotateCW(Image image) => zoneRayLib.imageRotateCW(image);

void imageRotateCCW(Image image) => zoneRayLib.imageRotateCCW(image);

void imageColorTint(Image image, Color color) =>
    zoneRayLib.imageColorTint(image, color);

void imageColorInvert(Image image) => zoneRayLib.imageColorInvert(image);

void imageColorGrayscale(Image image) => zoneRayLib.imageColorGrayscale(image);

void imageColorContrast(Image image, double contrast) =>
    zoneRayLib.imageColorContrast(image, contrast);

void imageColorBrightness(Image image, int brightness) =>
    zoneRayLib.imageColorBrightness(image, brightness);

void imageColorReplace(Image image, Color color, Color replace) =>
    zoneRayLib.imageColorReplace(image, color, replace);

List<Color> loadImageColors(Image image) => zoneRayLib.loadImageColors(image);

List<Color> loadImagePalette(Image image, int maxPaletteSize) =>
    zoneRayLib.loadImagePalette(image, maxPaletteSize);

Rectangle getImageAlphaBorder(Image image, double threshold) =>
    zoneRayLib.getImageAlphaBorder(image, threshold);

Color getImageColor(Image image, int x, int y) =>
    zoneRayLib.getImageColor(image, x, y);

/* ----- textures/texture_configuration.dart ----- */
void genTextureMipmaps(Texture2D texture) =>
    zoneRayLib.genTextureMipmaps(texture);

void setTextureFilter(Texture2D texture, TextureFilter filter) =>
    zoneRayLib.setTextureFilter(texture, filter);

void setTextureWrap(Texture2D texture, TextureWrap wrap) =>
    zoneRayLib.setTextureWrap(texture, wrap);

/* ----- textures/texture_drawing.dart ----- */
void drawTexture(Texture2D texture, int posX, int posY, Color tint) =>
    zoneRayLib.drawTexture(texture, posX, posY, tint);

void drawTextureV(Texture2D texture, Vector2 position, Color tint) =>
    zoneRayLib.drawTextureV(texture, position, tint);

void drawTextureEx(
  Texture2D texture,
  Vector2 position,
  double rotation,
  double scale,
  Color tint,
) =>
    zoneRayLib.drawTextureEx(texture, position, rotation, scale, tint);

void drawTextureRec(
  Texture2D texture,
  Rectangle source,
  Vector2 position,
  Color tint,
) =>
    zoneRayLib.drawTextureRec(texture, source, position, tint);

void drawTexturePro(
  Texture2D texture,
  Rectangle source,
  Rectangle dest,
  Vector2 origin,
  double rotation,
  Color tint,
) =>
    zoneRayLib.drawTexturePro(texture, source, dest, origin, rotation, tint);

void drawTextureNPatch(
  Texture2D texture,
  NPatchInfo nPatchInfo,
  Rectangle dest,
  Vector2 origin,
  double rotation,
  Color tint,
) =>
    zoneRayLib.drawTextureNPatch(
      texture,
      nPatchInfo,
      dest,
      origin,
      rotation,
      tint,
    );

/* ----- textures/texture_loading.dart ----- */
Texture2D loadTexture(String fileName) => zoneRayLib.loadTexture(fileName);

Texture2D loadTextureFromImage(Image image) =>
    zoneRayLib.loadTextureFromImage(image);

TextureCubemap loadTextureCubemap(Image image, CubemapLayout layout) =>
    zoneRayLib.loadTextureCubemap(image, layout);

RenderTexture2D loadRenderTexture(int width, int height) =>
    zoneRayLib.loadRenderTexture(width, height);

bool isTextureReady(Texture2D texture) => zoneRayLib.isTextureReady(texture);

void unloadTexture(Texture2D texture) => zoneRayLib.unloadTexture(texture);

bool isRenderTextureReady(RenderTexture2D target) =>
    zoneRayLib.isRenderTextureReady(target);

void unloadRenderTexture(RenderTexture2D target) =>
    zoneRayLib.unloadRenderTexture(target);

void updateTexture(Texture2D texture, Uint8List pixels) =>
    zoneRayLib.updateTexture(texture, pixels);

void updateTextureRec(Texture2D texture, Rectangle rec, Uint8List pixels) =>
    zoneRayLib.updateTextureRec(texture, rec, pixels);
