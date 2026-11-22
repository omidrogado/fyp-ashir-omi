/// CONTRACT 2 (YAMNet -> Dart EventChannel). Proposed; Track B must sign off.
/// JSON example: {"type": "fire_alarm", "confidence": 0.87, "ts": 1732270000000}
/// Only the class name crosses the boundary. Ambient audio never leaves the device.
enum DangerSoundType {
  siren('siren'),
  fireAlarm('fire_alarm'),
  glassBreak('glass_break'),
  carHorn('car_horn'),
  scream('scream');

  const DangerSoundType(this.wireName);
  final String wireName;

  static DangerSoundType? fromWireName(String name) {
    for (final DangerSoundType type in DangerSoundType.values) {
      if (type.wireName == name) return type;
    }
    return null;
  }
}

class DangerSoundEvent {
  const DangerSoundEvent({
    required this.type,
    required this.confidence,
    required this.timestampMs,
  });

  final DangerSoundType type;
  final double confidence;
  final int timestampMs;

  Map<String, Object?> toJson() => <String, Object?>{
        'type': type.wireName,
        'confidence': confidence,
        'ts': timestampMs,
      };

  factory DangerSoundEvent.fromJson(Map<String, Object?> json) {
    final DangerSoundType? type = DangerSoundType.fromWireName(json['type']! as String);
    if (type == null) {
      throw FormatException('Unknown danger sound type: ${json['type']}');
    }
    return DangerSoundEvent(
      type: type,
      confidence: (json['confidence']! as num).toDouble(),
      timestampMs: (json['ts']! as num).toInt(),
    );
  }
}