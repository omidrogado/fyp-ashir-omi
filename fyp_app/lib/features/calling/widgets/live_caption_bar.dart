import 'package:flutter/material.dart';

class LiveCaptionBar extends StatelessWidget {
  const LiveCaptionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(12)),
      child: const Text('Live captioning active...', style: TextStyle(color: Colors.white)),
    );
  }
}
