import 'package:raylib/src/enums/automation.dart';
import 'package:raylib/src/generated_raylib.dart' as raylib;
import 'package:raylib/src/internal/native.dart';
import 'package:raylib/src/types.dart';

class AutomationEvent extends NativeClass<raylib.AutomationEvent> {
  AutomationEvent.fromRef(super.ref) : super.fromRef();

  int get frame => ref.frame;
  AutomationEventType get type => AutomationEventType.values[ref.type];

  Array4<int> get params => (
        ref.params[0],
        ref.params[1],
        ref.params[2],
        ref.params[3],
      );
}

class AutomationEventList extends NativeClass<raylib.AutomationEventList>
    with Pointable, Unloadable {
  AutomationEventList.fromRef(super.ref) : super.fromRef();

  @override
  raylib.AutomationEventList get ref => pointer?.ref ?? super.ref;

  @override
  Pointer<raylib.AutomationEventList> getPointer() {
    if (pointer == null) {
      final oldRef = ref;
      pointer = calloc<raylib.AutomationEventList>();
      pointer!.ref = oldRef;
    }
    return pointer!;
  }

  @override
  void unload(raylib.RayLibNative native) =>
      native.UnloadAutomationEventList(getPointer());

  int get capacity => ref.capacity;
  int get count => ref.count;

  List<AutomationEvent> getEvents() {
    final List<AutomationEvent> events = [];
    for (int i = 0; i < ref.count; i++) {
      events.add(AutomationEvent.fromRef(ref.events[i]));
    }

    return events;
  }
}
