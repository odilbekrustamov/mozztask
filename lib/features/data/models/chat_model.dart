class ChatMessage {
  final String message;
  final String sender;
  final DateTime timestamp;
  final bool isRead;

  ChatMessage({
    required this.message,
    required this.sender,
    required this.timestamp,
    required this.isRead
  });
}