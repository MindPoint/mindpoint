import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindpoint/data/sources/abstract_auth_data_source.dart';

class UserViewModel extends ChangeNotifier {
  final AbstractAuthDataSource _firebaseAuthDataSource;

  User? _user;

  User? get user => _user;

  bool get isAuthenticated => _user != null;

  UserViewModel({required AbstractAuthDataSource fireBaseAuthDataSource})
      : _firebaseAuthDataSource = fireBaseAuthDataSource,
        _user = fireBaseAuthDataSource.currentUser;

  /// Update the user variable when successfully login
  Future<void> signIn() async {
    try {
      final user = await _firebaseAuthDataSource.signIn();

      if (user != null) {
        _user = user;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuthDataSource.signOut();

      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
