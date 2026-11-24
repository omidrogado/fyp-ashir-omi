import 'package:flutter/material.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/widgets/avatar_circle.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_search_rounded),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.userDiscovery),
          ),
          IconButton(
            icon: const Icon(Icons.edit_square),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.newChat),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const AvatarCircle(name: 'Raza'),
            title: const Text('Raza', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Salam, video call karein?'),
            trailing: const Text('14:32', style: TextStyle(fontSize: 12, color: Colors.grey)),
            onTap: () => Navigator.pushNamed(context, AppRoutes.conversation),
          ),
          ListTile(
            leading: const AvatarCircle(name: 'Zara'),
            title: const Text('Zara', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('[Voice Message: 0:14]'),
            trailing: const Text('12:15', style: TextStyle(fontSize: 12, color: Colors.grey)),
            onTap: () => Navigator.pushNamed(context, AppRoutes.conversation),
          ),
        ],
      ),
    );
  }
}
