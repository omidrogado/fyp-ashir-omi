/// CONTRACT 3b: POST /text-to-sign {"text": "Where is Anya"} ->
/// {"tokens": [{"type":"word","value":"where"},
///             {"type":"fingerspelling","value":"A"}, ... ]}
/// Known words map to pre-baked .glb clips; unknown words fall back to
/// letter-by-letter fingerspelling (the "A · N · Y · A" chips).
enum SignTokenKind {
  word('word'),
  fingerspelling('fingerspelling');

  const SignTokenKind(this.wireName);
  final String wireName;

  static SignTokenKind fromWireName(String name) =>
      SignTokenKind.values.firstWhere((SignTokenKind k) => k.wireName == name);
}

class SignToken {
  const SignToken({required this.kind, required this.value});

  const SignToken.word(String value) : this(kind: SignTokenKind.word, value: value);
  const SignToken.fingerspelling(String letter)
      : this(kind: SignTokenKind.fingerspelling, value: letter);

  final SignTokenKind kind;
  final String value;

  Map<String, Object?> toJson() => <String, Object?>{'type': kind.wireName, 'value': value};

  factory SignToken.fromJson(Map<String, Object?> json) => SignToken(
        kind: SignTokenKind.fromWireName(json['type']! as String),
        value: json['value']! as String,
      );
}

class TextToSignResult {
  const TextToSignResult({required this.sourceText, required this.tokens});

  final String sourceText;
  final List<SignToken> tokens;

  factory TextToSignResult.fromJson(String sourceText, Map<String, Object?> json) =>
      TextToSignResult(
        sourceText: sourceText,
        tokens: <SignToken>[
          for (final Object? t in json['tokens']! as List<Object?>)
            SignToken.fromJson(t! as Map<String, Object?>),
        ],
      );
}

abstract interface class TextToSignRepository {
  Future<TextToSignResult> convert(String text);
}