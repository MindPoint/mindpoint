// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindpoint/data/sources/abstract_auth_data_source.dart';
import 'package:mindpoint/data/sources/abstract_crud_data_source.dart';
import 'package:mindpoint/data/sources/remotes/fireabase_firestore_pages_data_source.dart';
import 'package:mindpoint/data/sources/remotes/fireabase_firestore_thoughts_data_source.dart';

class TimelineViewModel extends ChangeNotifier {
  final AbstractAuthDataSource _authDataSource;
  final AbstractCRUDDataSource _pagesDataSource;
  final AbstractCRUDDataSource _thoughtsDataSource;

  // String? _currentPageId;
  Stream<PagesModel>? _pagesSnapshot;
  // Stream<ThoughtsModel>? _currentPageThoughtsSnapshot;

  PagesModel pages = [];

  TimelineViewModel(
    this._authDataSource,
    this._pagesDataSource,
    this._thoughtsDataSource,
  ) {
    assert(_authDataSource.currentUser != null);

    _pagesSnapshot = _pagesDataSource.snapshot(
        _authDataSource.currentUser as User, '') as Stream<PagesModel>;

    _pagesSnapshot?.listen((event) {});
  }
}
