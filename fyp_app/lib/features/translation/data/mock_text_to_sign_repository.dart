import 'package:fyp_app/features/translation/domain/text_to_sign_repository.dart';

class MockTextToSignRepository implements TextToSignRepository {
  static const Set<String> _knownWords = <String>{
    'where',
    'go',
    'dinner',
    'thank',
    'you',
    'yes',
    'hello',
  };

  static final RegExp _whitespace = RegExp(r'\s+');
  static final RegExp _nonWord = RegExp(r'[^\p{L}\p{N}]', unicode: true);

  @override
  Future<TextToSignResult> convert(String text) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    final List<SignToken> tokens = <SignToken>[];
    for (final String raw in text.split(_whitespace)) {
      final String word = raw.toLowerCase().replaceAll(_nonWord, '');
      if (word.isEmpty) continue;
      if (_knownWords.contains(word)) {
        tokens.add(SignToken.word(word));
      } else {
        for (final int rune in word.runes) {
          tokens.add(SignToken.fingerspelling(String.fromCharCode(rune).toUpperCase()));
        }
      }
    }
    return TextToSignResult(sourceText: text, tokens: tokens);
  }
}