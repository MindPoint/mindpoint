import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Enables the user to login using a Google Account
Future<void> signInWithGoogle(
  FirebaseAuth auth,
  GoogleSignIn googleSignIn,
) async {
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
  } catch (e) {}
}

/// Signout from the google account
Future<void> signOut(
  FirebaseAuth auth,
  GoogleSignIn googleSignIn,
) {
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
