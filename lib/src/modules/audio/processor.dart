part of '../../raylib.dart';

mixin _AudioProcessorModule on _RayLibBase {
  AudioProcessorToken attachAudioStreamProcessor(
    AudioStream stream,
    FloatAudioCallback processor,
  ) {
    final callable =
        NativeCallable<raylib.AudioCallbackFunction>.listener(processor.wrap());

    native.AttachAudioStreamProcessor(
      stream.ref,
      callable.nativeFunction,
    );

    return AudioProcessorToken(callable);
  }

  void detachAudioStreamProcessor(
    AudioStream stream,
    AudioProcessorToken token,
  ) {
    native.DetachAudioStreamProcessor(
      stream.ref,
      token.nativeFunction,
    );
    token.dispose();
  }

  AudioProcessorToken attachAudioMixedProcessor(FloatAudioCallback processor) {
    final callable =
        NativeCallable<raylib.AudioCallbackFunction>.listener(processor.wrap());

    native.AttachAudioMixedProcessor(callable.nativeFunction);
    return AudioProcessorToken(callable);
  }

  void detachAudioMixedProcessor(AudioProcessorToken token) {
    native.DetachAudioMixedProcessor(token.nativeFunction);
    token.dispose();
  }
}
