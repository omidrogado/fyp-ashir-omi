import 'package:flutter/material.dart';

class VoiceMessageBubble extends StatelessWidget {
  final int durationSeconds;
  final bool isOutgoing;

  const VoiceMessageBubble({super.key, required this.durationSeconds, required this.isOutgoing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: const Icon(Icons.play_arrow_rounded), onPressed: () {}),
        Text('0:${durationSeconds.toString().padLeft(2, '0')}'),
      ],
    );
  }
}
