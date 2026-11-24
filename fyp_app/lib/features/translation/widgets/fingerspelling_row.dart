import 'package:flutter/material.dart';

class FingerspellingRow extends StatelessWidget {
  final String word;
  const FingerspellingRow({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: word.split('').map((char) => Text(char)).toList(),
    );
  }
}
