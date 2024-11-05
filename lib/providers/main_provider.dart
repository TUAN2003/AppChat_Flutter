import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomsProvider with ChangeNotifier {
  Stream<QuerySnapshot> getRooms() {
    return FirebaseFirestore.instance
        .collection('rooms')
        .where('members', arrayContains: 'eYMFvvVWTWcSloAmCEqD')
        .snapshots();
  }
}

class FriendsProvider {}
