import 'package:flutter/material.dart';

class CallControls extends StatelessWidget {
  const CallControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: const Icon(Icons.mic_off, color: Colors.white), onPressed: () {}),
        const SizedBox(width: 20),
        FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.call_end),
        ),
        const SizedBox(width: 20),
        IconButton(icon: const Icon(Icons.videocam_off, color: Colors.white), onPressed: () {}),
      ],
    );
  }
}
