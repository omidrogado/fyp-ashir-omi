import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DangerAlertsLogScreen extends StatelessWidget {
  const DangerAlertsLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('Alerts', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
      ),
      body: const Center(child: Text('Danger alert log will appear here.')),
    );
  }
}
