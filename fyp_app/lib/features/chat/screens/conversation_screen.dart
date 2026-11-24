import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input_bar.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raza'),
        actions: [
          IconButton(icon: const Icon(Icons.videocam_rounded), onPressed: () {}),
          IconButton(icon: const Icon(Icons.phone_rounded), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                MessageBubble(text: 'Salam! Aap theek hain?', isOutgoing: false),
                MessageBubble(text: 'Ji Alhumdulillah! Sign camera check kar raha hoon.', isOutgoing: true),
              ],
            ),
          ),
          const ChatInputBar(),
        ],
      ),
    );
  }
}
