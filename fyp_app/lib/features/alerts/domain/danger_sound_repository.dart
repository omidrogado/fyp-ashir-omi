import 'package:fyp_app/features/alerts/domain/danger_sound_event.dart';

abstract interface class DangerSoundRepository {
  Stream<DangerSoundEvent> watchEvents();
  Future<void> start();
  Future<void> stop();
}