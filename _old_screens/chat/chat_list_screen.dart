import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/router/app_router.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        title: Text('Chats', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bg,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit_square, color: colors.accent),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.newChat),
          ),
        ],
      ),
      body: const Center(
        child: Text('No conversations yet.'),
      ),
    );
  }
}
