import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindpoint/data/models/thought_model.dart';
import 'package:mindpoint/data/sources/abstract_crud_data_source.dart';

const firebaseFirestoreUsersCollectionKey = 'users';
const firebaseFirestoreThoughtsCollectionKey = 'thoughts';

typedef ThoughtsModel = List<ThoughtModel>;

typedef FirestoreThoughtsRemoteCRUD
    = AbstractCRUDDataSource<ThoughtsModel, String>;

class FirestoreThoughtsSource extends FirestoreThoughtsRemoteCRUD {
  FirestoreThoughtsSource(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> create(User user) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(User user) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ThoughtsModel> retrieve(User user) async {
    // Returns all thoughts of an user
    final data = await _firebaseFirestore
        .collection(firebaseFirestoreUsersCollectionKey)
        .doc(user.uid)
        .collection(firebaseFirestoreThoughtsCollectionKey)
        .get();

    return data.docs.map((doc) => ThoughtModel.fromDocument(doc)).toList();
  }

  @override
  Future<void> update(User user) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<ThoughtsModel> snapshot(User user, String data) {
    final StreamController<ThoughtsModel> controller = StreamController();

    final snapshots = _firebaseFirestore
        .collection(firebaseFirestoreUsersCollectionKey)
        .doc(user.uid)
        .collection(firebaseFirestoreThoughtsCollectionKey)
        .snapshots()
        .listen((event) {
      final data =
          event.docs.map((doc) => ThoughtModel.fromDocument(doc)).toList();

      controller.add(data);
    });

    controller.onPause = () => snapshots.pause();
    controller.onResume = () => snapshots.resume();
    controller.onCancel = () => snapshots.cancel();

    return controller.stream;
  }
}
