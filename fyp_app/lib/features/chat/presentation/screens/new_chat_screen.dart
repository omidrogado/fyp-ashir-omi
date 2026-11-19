import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('New Chat', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: const Center(
        child: Text('Contact search will appear here.'),
      ),
    );
  }
}
