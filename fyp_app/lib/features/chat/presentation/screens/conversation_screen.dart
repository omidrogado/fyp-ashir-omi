import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ConversationScreen extends StatelessWidget {
  final String contactName;
  const ConversationScreen({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text(contactName, style: TextStyle(color: colors.text, fontWeight: FontWeight.w600)),
        backgroundColor: colors.bg,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: const Center(
        child: Text('Messages will appear here.'),
      ),
    );
  }
}
