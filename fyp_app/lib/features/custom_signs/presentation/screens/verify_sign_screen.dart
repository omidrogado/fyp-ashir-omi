import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class VerifySignScreen extends StatelessWidget {
  const VerifySignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('Verify Sign', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: const Center(child: Text('Verification UI will appear here.')),
    );
  }
}
