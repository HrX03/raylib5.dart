part of '../../raylib.dart';

mixin _CoreRandomModule on _RayLibBase {
  void setRandomSeed(int seed) => native.SetRandomSeed(seed);

  int getRandomValue(int min, int max) => native.GetRandomValue(min, max);

  List<int> loadRandomSequence(int count, int min, int max) {
    final pointer = native.LoadRandomSequence(count, min, max);

    final data = <int>[];
    for (int i = 0; i < count; i++) {
      data.add(pointer[i]);
    }

    try {
      return data;
    } finally {
      native.UnloadRandomSequence(pointer);
    }
  }
}
