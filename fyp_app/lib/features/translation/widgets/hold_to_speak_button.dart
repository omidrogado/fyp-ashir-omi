import 'package:flutter/material.dart';

class HoldToSpeakButton extends StatelessWidget {
  const HoldToSpeakButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.mic),
      label: const Text('Hold to Speak'),
    );
  }
}
