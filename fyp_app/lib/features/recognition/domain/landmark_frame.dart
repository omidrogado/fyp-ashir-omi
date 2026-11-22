/// CONTRACT 1a (MediaPipe -> Dart EventChannel). Proposed; Track B must sign off.
///
/// JSON example:
/// {"ts": 1732270000000, "hands": [{"hand": "right",
///   "points": [{"x":0.5,"y":0.4,"z":-0.02}, ... 21 items ...],
///   "angles": [0.1, 1.2, ... 15 items, radians]}]}
/// x and y are normalised 0..1 in the camera image, z is relative depth.
/// Raw camera frames never cross this boundary, only these small arrays.
class LandmarkPoint {
  const LandmarkPoint({required this.x, required this.y, required this.z});

  final double x;
  final double y;
  final double z;

  Map<String, Object?> toJson() => <String, Object?>{'x': x, 'y': y, 'z': z};

  factory LandmarkPoint.fromJson(Map<String, Object?> json) => LandmarkPoint(
        x: (json['x']! as num).toDouble(),
        y: (json['y']! as num).toDouble(),
        z: (json['z']! as num).toDouble(),
      );
}

enum Handedness {
  left('left'),
  right('right');

  const Handedness(this.wireName);
  final String wireName;

  static Handedness fromWireName(String name) =>
      Handedness.values.firstWhere((Handedness h) => h.wireName == name);
}

class HandLandmarks {
  HandLandmarks({
    required this.handedness,
    required this.points,
    this.jointAngles = const <double>[],
  }) : assert(points.length == pointCount, 'A hand has exactly 21 landmarks');

  static const int pointCount = 21;

  final Handedness handedness;
  final List<LandmarkPoint> points;

  /// Finger-joint angles in radians (computed natively). May be empty in mocks.
  final List<double> jointAngles;

  Map<String, Object?> toJson() => <String, Object?>{
        'hand': handedness.wireName,
        'points': <Object?>[for (final LandmarkPoint p in points) p.toJson()],
        'angles': jointAngles,
      };

  factory HandLandmarks.fromJson(Map<String, Object?> json) {
    final List<Object?> rawPoints = json['points']! as List<Object?>;
    if (rawPoints.length != pointCount) {
      throw FormatException('Expected $pointCount landmarks, got ${rawPoints.length}');
    }
    final List<Object?> rawAngles = (json['angles'] as List<Object?>?) ?? const <Object?>[];
    return HandLandmarks(
      handedness: Handedness.fromWireName(json['hand']! as String),
      points: <LandmarkPoint>[
        for (final Object? p in rawPoints) LandmarkPoint.fromJson(p! as Map<String, Object?>),
      ],
      jointAngles: <double>[for (final Object? a in rawAngles) (a! as num).toDouble()],
    );
  }
}

class LandmarkFrame {
  const LandmarkFrame({required this.timestampMs, required this.hands});

  final int timestampMs;

  /// Zero, one or two hands.
  final List<HandLandmarks> hands;

  Map<String, Object?> toJson() => <String, Object?>{
        'ts': timestampMs,
        'hands': <Object?>[for (final HandLandmarks h in hands) h.toJson()],
      };

  factory LandmarkFrame.fromJson(Map<String, Object?> json) => LandmarkFrame(
        timestampMs: (json['ts']! as num).toInt(),
        hands: <HandLandmarks>[
          for (final Object? h in json['hands']! as List<Object?>)
            HandLandmarks.fromJson(h! as Map<String, Object?>),
        ],
      );
}