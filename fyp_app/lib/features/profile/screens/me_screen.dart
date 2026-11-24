import 'package:flutter/material.dart';
import '../../../core/constants/app_routes.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Me', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 48)),
          const SizedBox(height: 12),
          const Center(child: Text('Lafzio User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text('Edit Profile'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.editProfile),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications Settings'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.notificationsSettings),
          ),
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text('Privacy & Security'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.privacySecurity),
          ),
          ListTile(
            leading: const Icon(Icons.text_fields_outlined),
            title: const Text('Text Display'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.textDisplay),
          ),
        ],
      ),
    );
  }
}
