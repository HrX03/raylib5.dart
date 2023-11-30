part of '../../raylib.dart';

mixin _ModelsModelAnimationLoadingModule on _RayLibBase {
  List<ModelAnimation> loadModelAnimations(String fileName) {
    return using((arena) {
      final animCountP = arena<Int>();
      final animationsP = native.LoadModelAnimations(
        fileName.toNativeUtf8(allocator: arena).cast(),
        animCountP,
      );

      final List<ModelAnimation> materials = [];
      for (int i = 0; i < animCountP.value; i++) {
        materials.add(ModelAnimation.fromRef(animationsP[i]));
      }

      return materials;
    });
  }

  void updateModelAnimation(Model model, ModelAnimation anim, int frame) =>
      native.UpdateModelAnimation(model.ref, anim.ref, frame);

  void unloadModelAnimation(ModelAnimation anim) =>
      native.UnloadModelAnimation(anim.ref);

  void unloadModelAnimations(List<ModelAnimation> animations) =>
      animations.forEach(unloadModelAnimation);

  bool isModelAnimationValid(Model model, ModelAnimation anim) =>
      native.IsModelAnimationValid(model.ref, anim.ref);
}
