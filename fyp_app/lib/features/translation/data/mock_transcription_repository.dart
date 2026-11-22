import 'package:fyp_app/features/translation/domain/transcription_repository.dart';

class MockTranscriptionRepository implements TranscriptionRepository {
  @override
  Future<TranscriptionResult> transcribe({required String audioFilePath}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const TranscriptionResult(
      text: 'Where should we go for dinner?',
      languageCode: 'en',
    );
  }
}