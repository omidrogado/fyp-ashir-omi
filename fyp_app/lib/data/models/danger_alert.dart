class DangerAlert {
  final String id;
  final String soundType; // e.g. siren, smoke_alarm, honk, glass_break
  final double confidence;
  final DateTime timestamp;
  final bool wasAcknowledged;

  const DangerAlert({
    required this.id,
    required this.soundType,
    required this.confidence,
    required this.timestamp,
    this.wasAcknowledged = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sound_type': soundType,
      'confidence': confidence,
      'timestamp': timestamp.toIso8601String(),
      'was_acknowledged': wasAcknowledged ? 1 : 0,
    };
  }

  factory DangerAlert.fromMap(Map<String, dynamic> map) {
    return DangerAlert(
      id: map['id'] as String,
      soundType: map['sound_type'] as String,
      confidence: (map['confidence'] as num).toDouble(),
      timestamp: DateTime.parse(map['timestamp'] as String),
      wasAcknowledged: (map['was_acknowledged'] as int) == 1,
    );
  }
}
