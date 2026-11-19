import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class RecordSignScreen extends StatelessWidget {
  const RecordSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text('Record Sign', style: TextStyle(color: colors.onAccent)),
      ),
      body: const Center(
        child: Text('Recording flow will appear here.', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
