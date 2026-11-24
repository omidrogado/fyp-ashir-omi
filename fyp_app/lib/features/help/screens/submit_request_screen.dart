import 'package:flutter/material.dart';

class SubmitRequestScreen extends StatelessWidget {
  const SubmitRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Request')),
      body: const Center(child: Text('Submit inquiry form')),
    );
  }
}
