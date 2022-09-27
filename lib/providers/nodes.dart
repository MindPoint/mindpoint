import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/providers/main.dart';

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
