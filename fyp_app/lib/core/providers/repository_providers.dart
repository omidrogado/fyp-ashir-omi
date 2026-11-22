import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_app/features/alerts/data/mock_danger_sound_repository.dart';
import 'package:fyp_app/features/alerts/domain/danger_sound_repository.dart';
import 'package:fyp_app/features/auth/data/mock_auth_repository.dart';
import 'package:fyp_app/features/auth/domain/auth_repository.dart';
import 'package:fyp_app/features/recognition/data/mock_sign_recognition_repository.dart';
import 'package:fyp_app/features/recognition/domain/sign_recognition_repository.dart';
import 'package:fyp_app/features/translation/data/mock_text_to_sign_repository.dart';
import 'package:fyp_app/features/translation/data/mock_transcription_repository.dart';
import 'package:fyp_app/features/translation/domain/text_to_sign_repository.dart';
import 'package:fyp_app/features/translation/domain/transcription_repository.dart';

// Composition root. In Phase 1 and Phase 5 swap the Mock* classes below for the
// real Supabase / FastAPI / platform-channel implementations. Nothing else changes.

final Provider<AuthRepository> authRepositoryProvider = Provider<AuthRepository>((Ref ref) {
  // Dev default is signedIn so the tab shell is visible.
  // Use AuthStatus.signedOut to exercise the onboarding guard.
  final MockAuthRepository repo = MockAuthRepository();
  ref.onDispose(repo.dispose);
  return repo;
});

final Provider<SignRecognitionRepository> signRecognitionRepositoryProvider =
    Provider<SignRecognitionRepository>((Ref ref) {
  final MockSignRecognitionRepository repo = MockSignRecognitionRepository();
  ref.onDispose(repo.dispose);
  return repo;
});

final Provider<DangerSoundRepository> dangerSoundRepositoryProvider =
    Provider<DangerSoundRepository>((Ref ref) {
  final MockDangerSoundRepository repo = MockDangerSoundRepository();
  ref.onDispose(repo.dispose);
  return repo;
});

final Provider<TranscriptionRepository> transcriptionRepositoryProvider =
    Provider<TranscriptionRepository>((Ref ref) => MockTranscriptionRepository());

final Provider<TextToSignRepository> textToSignRepositoryProvider =
    Provider<TextToSignRepository>((Ref ref) => MockTextToSignRepository());