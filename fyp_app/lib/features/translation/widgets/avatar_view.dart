import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.withValues(alpha: 0.1),
      child: const Center(child: Text('.glb 3D Avatar Viewport')),
    );
  }
}
