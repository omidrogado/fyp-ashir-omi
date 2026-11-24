import 'package:flutter/material.dart';

class FaceToFaceScreen extends StatelessWidget {
  const FaceToFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face to Face')),
      body: const Center(child: Text('Two-way sign ↔ speech translation split view')),
    );
  }
}
