import 'package:flutter/material.dart';

class ActiveCallScreen extends StatelessWidget {
  const ActiveCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'Active call + WebRTC + avatar stream will appear here.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
