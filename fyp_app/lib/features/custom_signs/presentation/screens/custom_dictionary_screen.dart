import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CustomDictionaryScreen extends StatelessWidget {
  const CustomDictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('My Signs', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
        leading: BackButton(color: colors.text),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: colors.accent),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(child: Text('Custom signs dictionary will appear here.')),
    );
  }
}
