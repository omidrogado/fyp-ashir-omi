import 'package:flutter/material.dart';

class TeachSignScreen extends StatelessWidget {
  const TeachSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teach New Sign')),
      body: const Center(child: Text('Record 3 takes of custom sign')),
    );
  }
}
