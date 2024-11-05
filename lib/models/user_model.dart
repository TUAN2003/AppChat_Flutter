import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String phone;
  final String avatarUrl;

  UserModel({
    required this.name,
    required this.id,
    required this.phone,
    required this.avatarUrl,
  });

  factory UserModel.fromDocSnap(DocumentSnapshot doc) {
    final userData = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      name: userData['name'] ?? '',
      phone: userData['phone'] ?? '',
      avatarUrl: userData['avatarUrl'] ?? '',
    );
  }

  List<String> toStringList() {
    return [id, name, phone, avatarUrl];
  }
}
