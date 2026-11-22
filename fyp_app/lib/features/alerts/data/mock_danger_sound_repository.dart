import 'dart:async';

import 'package:fyp_app/features/alerts/domain/danger_sound_event.dart';
import 'package:fyp_app/features/alerts/domain/danger_sound_repository.dart';

class MockDangerSoundRepository implements DangerSoundRepository {
  final StreamController<DangerSoundEvent> _events = StreamController<DangerSoundEvent>.broadcast();

  @override
  Stream<DangerSoundEvent> watchEvents() => _events.stream;

  @override
  Future<void> start() async {}

  @override
  Future<void> stop() async {}

  /// Dev / test helper: fire a fake detection to build the banner and haptic flow.
  void emit(DangerSoundType type, {double confidence = 0.9}) {
    _events.add(
      DangerSoundEvent(
        type: type,
        confidence: confidence,
        timestampMs: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void dispose() => _events.close();
}