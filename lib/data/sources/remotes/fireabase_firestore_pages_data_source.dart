import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mindpoint/data/sources/abstract_crud_data_source.dart';

import '../../models/page_model.dart';
import '../../constants/constants.dart';

typedef PagesModel = List<PageModel>;

typedef FirestorePagesRemoteCRUD = AbstractCRUDDataSource<PagesModel, String>;

class FirestorePagesSource extends FirestorePagesRemoteCRUD {
  FirestorePagesSource(this._firebaseFirestore);

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
  Future<PagesModel> retrieve(User user) async {
    // Returns all thoughts of an user
    final data = await _firebaseFirestore
        .collection(firebaseFirestoreUsersCollectionKey)
        .doc(user.uid)
        .collection(firebaseFirestorePagesCollectionKey)
        .get();

    return data.docs.map((doc) => PageModel.fromDocument(doc)).toList().cast();
  }

  @override
  Future<void> update(User user) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<PagesModel> snapshot(User user, String data) {
    final StreamController<PagesModel> controller = StreamController();

    final snapshots = _firebaseFirestore
        .collection(firebaseFirestoreUsersCollectionKey)
        .doc(user.uid)
        .collection(firebaseFirestorePagesCollectionKey)
        .snapshots()
        .listen((event) {
      final data =
          event.docs.map((doc) => PageModel.fromDocument(doc)).toList();

      controller.add(data);
    });

    controller.onPause = () => snapshots.pause();
    controller.onResume = () => snapshots.resume();
    controller.onCancel = () => snapshots.cancel();

    return controller.stream;
  }
}
