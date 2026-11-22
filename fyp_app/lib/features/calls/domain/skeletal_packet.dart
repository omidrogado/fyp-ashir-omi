import 'package:fyp_app/features/recognition/domain/landmark_frame.dart';

/// CONTRACT 4a: low-bandwidth WebRTC Data Channel packet. Proposed; Track B must sign off.
/// JSON: {"v":1,"sender":"<userId>","seq":42,"ts":1732270000000,"hands":[...same as LandmarkFrame hands...]}
/// Sent instead of video; the receiver drives the sender's avatar from it.
class SkeletalPacket {
  SkeletalPacket({
    required this.senderId,
    required this.sequence,
    required this.timestampMs,
    required this.hands,
  });

  static const int schemaVersion = 1;

  final String senderId;
  final int sequence;
  final int timestampMs;
  final List<HandLandmarks> hands;

  Map<String, Object?> toJson() => <String, Object?>{
        'v': schemaVersion,
        'sender': senderId,
        'seq': sequence,
        'ts': timestampMs,
        'hands': <Object?>[for (final HandLandmarks h in hands) h.toJson()],
      };

  factory SkeletalPacket.fromJson(Map<String, Object?> json) {
    final int version = (json['v']! as num).toInt();
    if (version != schemaVersion) {
      throw FormatException('Unsupported skeletal packet version: $version');
    }
    return SkeletalPacket(
      senderId: json['sender']! as String,
      sequence: (json['seq']! as num).toInt(),
      timestampMs: (json['ts']! as num).toInt(),
      hands: <HandLandmarks>[
        for (final Object? h in json['hands']! as List<Object?>)
          HandLandmarks.fromJson(h! as Map<String, Object?>),
      ],
    );
  }
}