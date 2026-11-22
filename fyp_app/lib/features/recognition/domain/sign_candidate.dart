/// CONTRACT 1b (DTW isolate -> UI). Proposed; Track B must sign off.
class SignCandidate {
  const SignCandidate({required this.word, required this.confidence});

  final String word;

  /// 0..1, higher is better.
  final double confidence;

  Map<String, Object?> toJson() => <String, Object?>{'word': word, 'confidence': confidence};

  factory SignCandidate.fromJson(Map<String, Object?> json) => SignCandidate(
        word: json['word']! as String,
        confidence: (json['confidence']! as num).toDouble(),
      );
}

class SignMatchResult {
  const SignMatchResult({
    required this.timestampMs,
    required this.ranked,
    required this.isAmbiguous,
  });

  final int timestampMs;

  /// Best first.
  final List<SignCandidate> ranked;

  /// True when the top candidates are nearly equal or the sign has two meanings.
  /// The UI then shows the no-timeout tap-selection pop-up (LFR-018, 019).
  final bool isAmbiguous;

  SignCandidate? get top => ranked.isEmpty ? null : ranked.first;
}