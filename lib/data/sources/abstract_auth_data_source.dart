import 'package:firebase_auth/firebase_auth.dart';

// TODO: Create an abstraction of the [User] class, to provide a way to use multipe
// [AuthDataSource]s, for now, is ok to keep this way, given the fact that we
// will be only using Firebase

abstract class AbstractAuthDataSource {
  User? get currentUser;
  Future<void> signOut();
  Future<User?> signIn();
}
