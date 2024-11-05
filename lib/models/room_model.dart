import 'package:appchat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomModel {
  final String id;
  final String name;
  final String avatarUrl;
  final List<String> members;
  final int type;

  RoomModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.members,
    required this.type,
  });

  factory RoomModel.fromDocSnap(DocumentSnapshot doc) {
    final room = doc.data() as Map<String, dynamic>;
    return RoomModel(
      id: doc.id,
      name: room['name'] ?? '',
      avatarUrl: room['avatarUrl'] ?? '',
      members: [],
      type: room['type'] ?? -1,
    );
  }
}
