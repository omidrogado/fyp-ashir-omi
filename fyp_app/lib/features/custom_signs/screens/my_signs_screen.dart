import 'package:flutter/material.dart';

class MySignsScreen extends StatelessWidget {
  const MySignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Signs')),
      body: const Center(child: Text('Custom signs list')),
    );
  }
}
