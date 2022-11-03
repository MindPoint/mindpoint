import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provides the FirebaseAuth instance
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// A stream that returns the current user, if it is null, it will try to
// login anonimously
final authStateChangesProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges()
    // Ensures the app always have an user to store the data
    ..listen(
      (user) => user ?? ref.read(firebaseAuthProvider).signInAnonymously(),
    ),
);

/// Enables the user to login using a Google Account
Future<void> signInWithGoogle() async {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  try {
    final account = await googleSignIn.signIn();

    if (account == null) return;

    final accountAuth = await account.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: accountAuth.idToken,
      accessToken: accountAuth.accessToken,
    );

    final credential = await auth.signInWithCredential(authCredential);

    final currentUser = FirebaseAuth.instance.currentUser;

    assert(credential.user?.uid == currentUser?.uid);
  } catch (e) {
    log('$e');
  }
}

/// Signout from the google account
Future<void> signOut() {
  final auth = FirebaseAuth.instance;

  void handleSignOutSuccess(_) {
    auth.signOut();
  }

  void handleSignOutError(error) {
    throw error;
  }

  return GoogleSignIn()
      .signOut()
      .then(handleSignOutSuccess)
      .catchError(handleSignOutError);
}

// Login the user anonymously
Future<void> signInAnonymously(
  FirebaseAuth auth,
) async {
  await auth.signInAnonymously();
}
