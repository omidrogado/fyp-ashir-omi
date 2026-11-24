import 'package:flutter/material.dart';

class TextDisplayScreen extends StatelessWidget {
  const TextDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text & Display')),
      body: const Center(child: Text('Theme and font size adjustments')),
    );
  }
}
