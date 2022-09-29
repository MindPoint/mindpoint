import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

const firebaseFirestoreUsersCollectionKey = 'users';
const firebaseFirestoreThoughtsCollectionKey = 'nodes';

final firebaseFireStoreInstanceProvider =
    Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

final nodesProvider = StreamProvider((ref) {
  final user = ref.watch(authStateChangesProvider);
  final fireStore = ref.watch(firebaseFireStoreInstanceProvider);

  return fireStore
      .collection(firebaseFirestoreUsersCollectionKey)
      .doc(user.value?.uid)
      .collection(firebaseFirestoreThoughtsCollectionKey)
      .snapshots()
      .map((event) => event.docs.map((doc) => Node.fromDocument(doc)));
});

Future addNode(User user, Node node) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('nodes')
      .doc(node.timestamp.toIso8601String())
      .set(node.toJson());
}
