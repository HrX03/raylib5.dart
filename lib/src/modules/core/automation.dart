part of '../../raylib.dart';

mixin _CoreAutomationModule on _RayLibBase {
  AutomationEventList loadAutomationEventList([String? fileName]) {
    return using(
      (arena) => AutomationEventList.fromRef(
        native.LoadAutomationEventList(
          fileName?.toNativeUtf8(allocator: arena).cast() ?? nullptr,
        ),
      ),
    );
  }

  void unloadAutomationEventList(AutomationEventList list) {
    return native.UnloadAutomationEventList(list.getReference());
  }

  bool exportAutomationEventList(AutomationEventList list, String fileName) {
    return using(
      (arena) => native.ExportAutomationEventList(
        list.ref,
        fileName.toNativeUtf8(allocator: arena).cast(),
      ),
    );
  }

  void setAutomationEventList(AutomationEventList list) =>
      native.SetAutomationEventList(list.getReference());

  void setAutomationEventBaseFrame(int frame) =>
      native.SetAutomationEventBaseFrame(frame);

  void startAutomationEventRecording() =>
      native.StartAutomationEventRecording();

  void stopAutomationEventRecording() => native.StopAutomationEventRecording();

  void playAutomationEvent(AutomationEvent event) =>
      native.PlayAutomationEvent(event.ref);
}
