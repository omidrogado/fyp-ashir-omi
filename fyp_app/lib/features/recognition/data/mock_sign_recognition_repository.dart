import 'dart:async';

import 'package:fyp_app/features/recognition/domain/landmark_frame.dart';
import 'package:fyp_app/features/recognition/domain/sign_candidate.dart';
import 'package:fyp_app/features/recognition/domain/sign_recognition_repository.dart';

class MockSignRecognitionRepository implements SignRecognitionRepository {
  final StreamController<LandmarkFrame> _frames = StreamController<LandmarkFrame>.broadcast();
  final StreamController<SignMatchResult> _matches = StreamController<SignMatchResult>.broadcast();
  Timer? _timer;
  int _tick = 0;

  @override
  Stream<LandmarkFrame> watchLandmarks() => _frames.stream;

  @override
  Stream<SignMatchResult> watchMatches() => _matches.stream;

  @override
  Future<void> start() async {
    _timer ??= Timer.periodic(const Duration(milliseconds: 500), (Timer _) => _emit());
  }

  @override
  Future<void> stop() async {
    _timer?.cancel();
    _timer = null;
  }

  void _emit() {
    _tick++;
    final int now = DateTime.now().millisecondsSinceEpoch;

    _frames.add(
      LandmarkFrame(
        timestampMs: now,
        hands: <HandLandmarks>[
          HandLandmarks(
            handedness: Handedness.right,
            points: <LandmarkPoint>[
              for (int i = 0; i < HandLandmarks.pointCount; i++)
                LandmarkPoint(x: i / HandLandmarks.pointCount, y: 0.5, z: 0),
            ],
          ),
        ],
      ),
    );

    // Every 4th result is ambiguous so the pop-up flow can be built against the mock.
    final bool ambiguous = _tick % 4 == 0;
    _matches.add(
      SignMatchResult(
        timestampMs: now,
        isAmbiguous: ambiguous,
        ranked: ambiguous
            ? const <SignCandidate>[
                SignCandidate(word: 'Dinner', confidence: 0.92),
                SignCandidate(word: 'Lunch', confidence: 0.90),
              ]
            : const <SignCandidate>[SignCandidate(word: 'Thank you', confidence: 0.95)],
      ),
    );
  }

  void dispose() {
    _timer?.cancel();
    _frames.close();
    _matches.close();
  }
}