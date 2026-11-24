import 'package:flutter/material.dart';

class OutgoingCallScreen extends StatelessWidget {
  const OutgoingCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('Calling peer...', style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
