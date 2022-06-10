import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/auth_repository.dart';

class UserViewModel extends ChangeNotifier {
  final AbstractAuthRepository _firebaseAuthRepository;

  User? _user;

  User? get user => _user;

  bool get isAuthenticated => _user != null;

  UserViewModel({required AbstractAuthRepository fireBaseAuthRepository})
      : _firebaseAuthRepository = fireBaseAuthRepository,
        _user = fireBaseAuthRepository.currentUser;

  /// Update the user variable when successfully login
  Future<void> signIn() async {
    try {
      final user = await _firebaseAuthRepository.signIn();

      print(user);

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
      await _firebaseAuthRepository.signOut();

      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
