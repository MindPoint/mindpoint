import 'dart:developer';

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
      .map((event) => event.docs.map((doc) => FirestoreNode.fromDocument(doc)));
});

final nodesClassProvider = Provider((ref) {
  final user = ref.watch(authStateChangesProvider).value;
  final firestore = ref.watch(firebaseFireStoreInstanceProvider);

  return NodesProvider(
    user: user,
    firestore: firestore,
  );
});

class NodesProvider extends StateNotifier<Map<String, FirestoreNode>> {
  final User? user;
  final FirebaseFirestore? firestore;

  NodesProvider({
    required this.user,
    required this.firestore,
  }) : super({});

  // Returns a stream of FirestoreNodes
  Stream<Iterable<FirestoreNode>> get streaming {
    final stream = FirebaseFirestore.instance
        .collection(firebaseFirestoreUsersCollectionKey)
        .doc(user?.uid)
        .collection(firebaseFirestoreThoughtsCollectionKey)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => FirestoreNode.fromDocument(doc)));

    // Adds all unique nodes to the nodes Map
    stream.forEach((nodes) {
      for (var node in nodes) {
        state[node.timestamp.toIso8601String()] = node;
      }
    });

    return stream;
  }

  // Return a list of FirestoreNodes
  List<FirestoreNode> get nodes {
    return state.values.toList();
  }
}

Future addNode(User? user, FirestoreNode node) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user?.uid)
      .collection('nodes')
      .doc(node.timestamp.toIso8601String())
      .set(node.toJson());
}
