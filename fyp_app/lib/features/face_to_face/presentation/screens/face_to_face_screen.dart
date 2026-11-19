import 'package:flutter/material.dart';

class FaceToFaceScreen extends StatelessWidget {
  const FaceToFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text('Face to Face', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text(
          'Two-way sign ↔ text translation on a single screen will appear here.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
