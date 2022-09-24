import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final userLogedInProvider =
    Provider<bool>((ref) => ref.watch(authStateChangesProvider).value != null);

final usernameProvider = StateProvider<String>(
  (ref) =>
      ref.watch(authStateChangesProvider).value?.displayName ??
      'Anonymous User',
);

final currentThoughtDataProvider = StateProvider<String>(
  (ref) => '',
);

final currentMenuProvider =
    StateProvider<AvailableMenus>((ref) => AvailableMenus.none);

final userIsOnProfileMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == AvailableMenus.profile);

final userIsOnAttachmentsMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == AvailableMenus.attachments);

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
