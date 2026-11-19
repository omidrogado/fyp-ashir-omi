import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class TextToSignScreen extends StatelessWidget {
  const TextToSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('Text to Sign', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: const Center(child: Text('Text → Sign translation with avatar will appear here.')),
    );
  }
}
