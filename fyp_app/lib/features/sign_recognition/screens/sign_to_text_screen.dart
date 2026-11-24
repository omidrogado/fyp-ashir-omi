import 'package:flutter/material.dart';

class SignToTextScreen extends StatelessWidget {
  const SignToTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign to Text')),
      body: const Center(child: Text('Camera feed + Hand landmarks overlay')),
    );
  }
}
