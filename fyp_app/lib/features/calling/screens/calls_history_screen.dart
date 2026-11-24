import 'package:flutter/material.dart';

class CallsHistoryScreen extends StatelessWidget {
  const CallsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calls', style: TextStyle(fontWeight: FontWeight.bold))),
      body: const Center(child: Text('Calls history log')),
    );
  }
}
