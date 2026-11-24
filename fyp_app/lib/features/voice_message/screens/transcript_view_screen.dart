import 'package:flutter/material.dart';

class TranscriptViewScreen extends StatelessWidget {
  final String transcript;
  const TranscriptViewScreen({super.key, required this.transcript});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice Transcript')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(transcript, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
