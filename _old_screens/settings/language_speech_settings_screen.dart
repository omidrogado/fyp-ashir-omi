import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class LanguageSpeechSettingsScreen extends StatelessWidget {
  const LanguageSpeechSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bgGrouped,
      appBar: AppBar(
        title: Text('Language & Speech', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bgGrouped,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: const Center(child: Text('Language and speech preference settings will appear here.')),
    );
  }
}
