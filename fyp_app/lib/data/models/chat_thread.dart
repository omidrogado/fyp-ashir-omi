class ChatThread {
  final String id;
  final String participantId;
  final String participantName;
  final String? participantAvatar;
  final String lastMessage;
  final DateTime lastMessageTimestamp;
  final int unreadCount;

  const ChatThread({
    required this.id,
    required this.participantId,
    required this.participantName,
    this.participantAvatar,
    required this.lastMessage,
    required this.lastMessageTimestamp,
    this.unreadCount = 0,
  });
}
