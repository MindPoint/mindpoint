import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../abstract_auth_data_source.dart';

class FirebaseAuthRemoteDataSource extends AbstractAuthDataSource {
  FirebaseAuthRemoteDataSource(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  /// Signin with google and firebase
  @override
  Future<User?> signIn() async {
    final account = await GoogleSignIn().signIn();

    if (account == null) throw StateError('Maybe user canceled.');

    final auth = await account.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );

    final credential = await _firebaseAuth.signInWithCredential(authCredential);

    final currentUser = FirebaseAuth.instance.currentUser;

    assert(credential.user?.uid == currentUser?.uid);

    return credential.user;
  }

  /// Signout from google and firebase
  @override
  Future<void> signOut() {
    void handleSignOutSuccess(_) {
      _firebaseAuth.signOut();
    }

    void handleSignOutError(error) {
      debugPrint(error.toString());
      throw error;
    }

    return GoogleSignIn()
        .signOut()
        .then(handleSignOutSuccess)
        .catchError(handleSignOutError);
  }

  @override
  User? get currentUser => _firebaseAuth.currentUser;
}
