import 'package:flutter/material.dart';

class SignConflictScreen extends StatelessWidget {
  const SignConflictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Conflict')),
      body: const Center(child: Text('Sign conflict resolution')),
    );
  }
}
