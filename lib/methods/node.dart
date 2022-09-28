import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindpoint/data/models/node.dart';

Future addNode(User user, Node node) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('nodes')
      .doc(node.timestamp.toIso8601String())
      .set(node.toJson());
}
