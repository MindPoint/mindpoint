import 'dart:developer';
import 'package:encrypt/encrypt.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

const firebaseFirestoreUsersCollectionKey = 'users';
const firebaseFirestoreThoughtsCollectionKey = 'nodes';

final firebaseFireStoreInstanceProvider =
    Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

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
        .map((event) => event.docs.map((doc) {
              final node = FirestoreNode.fromDocument(doc);
              final decrypted = FirestoreNode(
                type: node.type,
                data: decrypt(user, node.data),
                timestamp: node.timestamp,
              );

              return decrypted;
            }));

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

String encrypt(User? user, String data) {
  final hash = generateUserUniqueHash(user);
  final key = Key.fromUtf8(hash.substring(0, 32));
  final iv = IV.fromUtf8(hash.substring(0, 16));
  final encrypter = Encrypter(AES(key));

  return encrypter.encrypt(data, iv: iv).base64;
}

String decrypt(User? user, String data) {
  try {
    final hash = generateUserUniqueHash(user);
    final key = Key.fromUtf8(hash.substring(0, 32));
    final iv = IV.fromUtf8(hash.substring(0, 16));
    final encrypter = Encrypter(AES(key));

    return encrypter.decrypt64(data, iv: iv);
  } catch (e) {
    return data;
  }
}

Future addNode(User? user, FirestoreNode node) {
  final encrypted = FirestoreNode(
    type: node.type,
    data: encrypt(user, node.data),
    timestamp: node.timestamp,
  );

  return FirebaseFirestore.instance
      .collection('users')
      .doc(user?.uid)
      .collection('nodes')
      .doc(encrypted.timestamp.toIso8601String())
      .set(encrypted.toJson());
}
