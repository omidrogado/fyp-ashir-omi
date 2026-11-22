/// CONTRACT 3a: POST /transcribe (multipart audio) ->
/// {"text": "Where should we go for dinner?", "language": "en"}
/// Stateless: the server deletes the audio right after responding.
class TranscriptionResult {
  const TranscriptionResult({required this.text, required this.languageCode});

  final String text;
  final String languageCode;

  factory TranscriptionResult.fromJson(Map<String, Object?> json) => TranscriptionResult(
        text: json['text']! as String,
        languageCode: (json['language'] as String?) ?? 'und',
      );
}

abstract interface class TranscriptionRepository {
  /// Throws a [Failure] (for example TranscriptionFailure / NetworkFailure) on error.
  Future<TranscriptionResult> transcribe({required String audioFilePath});
}