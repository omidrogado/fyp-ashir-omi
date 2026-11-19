import 'package:flutter/material.dart';

class OutgoingCallScreen extends StatelessWidget {
  final String contactName;
  const OutgoingCallScreen({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.video_call_rounded, color: Colors.white, size: 72),
              const SizedBox(height: 24),
              Text(
                contactName,
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Calling…', style: TextStyle(color: Colors.white70, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
