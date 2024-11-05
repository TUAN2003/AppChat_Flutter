class MessageModel {
  final String id;
  final String toRoomId;
  final String fromUserId;
  final String content;
  final String timestamp;

  const MessageModel(
      {required this.id,
      required this.toRoomId,
      required this.fromUserId,
      required this.content,
      required this.timestamp});

  Map<String, dynamic> toMap() => {};
}
