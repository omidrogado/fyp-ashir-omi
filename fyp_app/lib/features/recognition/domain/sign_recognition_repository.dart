import 'package:fyp_app/features/recognition/domain/landmark_frame.dart';
import 'package:fyp_app/features/recognition/domain/sign_candidate.dart';

abstract interface class SignRecognitionRepository {
  /// Landmarks from the native MediaPipe pipeline (EventChannel in Phase 3 / 5).
  Stream<LandmarkFrame> watchLandmarks();

  /// Ranked matches produced by the DTW background isolate.
  Stream<SignMatchResult> watchMatches();

  Future<void> start();
  Future<void> stop();
}