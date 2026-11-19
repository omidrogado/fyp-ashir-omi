import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AvatarPreviewScreen extends StatelessWidget {
  const AvatarPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('Avatar Preview', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: const Center(child: Text('3D avatar (.glb) playback will appear here.')),
    );
  }
}
