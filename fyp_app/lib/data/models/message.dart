class Message {
  final String id;
  final String threadId;
  final String senderId;
  final String text;
  final String type; // text, voice, sign
  final String? mediaUrl;
  final DateTime timestamp;
  final String status; // sent, delivered, read

  const Message({
    required this.id,
    required this.threadId,
    required this.senderId,
    required this.text,
    this.type = 'text',
    this.mediaUrl,
    required this.timestamp,
    this.status = 'sent',
  });
}
