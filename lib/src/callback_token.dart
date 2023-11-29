import 'dart:ffi';

class CallbackToken<T extends Function> {
  final NativeCallable<T> _ref;

  const CallbackToken(this._ref);

  Pointer<NativeFunction<T>> get nativeFunction => _ref.nativeFunction;
  void dispose() => _ref.close();
}
