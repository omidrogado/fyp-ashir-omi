import 'package:flutter/material.dart';

class UserDiscoveryScreen extends StatelessWidget {
  const UserDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discover Users')),
      body: const Center(child: Text('Search users by phone or QR code')),
    );
  }
}
