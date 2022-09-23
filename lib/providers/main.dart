import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';

// class UserViewModel {
//   final FirebaseAuth auth;
//   final User? user;

//   UserViewModel({
//     required this.auth,
//     this.user,
//   }) {
//     // Automagically logins the user
//     if (user == null) signInAnonymously();
//   }

//   /// Login the user anonymously
//   Future<void> signInAnonymously() async {
//     await FirebaseAuth.instance.signInAnonymously();
//   }

//   /// Login the user using a google account
//   Future<void> signIn() async {
//     final account = await GoogleSignIn().signIn();

//     if (account == null) throw StateError('Maybe user canceled.');

//     final accountAuth = await account.authentication;

//     final AuthCredential authCredential = GoogleAuthProvider.credential(
//       idToken: accountAuth.idToken,
//       accessToken: accountAuth.accessToken,
//     );

//     final credential = await auth.signInWithCredential(authCredential);

//     final currentUser = FirebaseAuth.instance.currentUser;

//     assert(credential.user?.uid == currentUser?.uid);
//   }

//   /// Signout from the google account
//   Future<void> signOut() {
//     void handleSignOutSuccess(_) {
//       auth.signOut();
//     }

//     void handleSignOutError(error) {
//       throw error;
//     }

//     return GoogleSignIn()
//         .signOut()
//         .then(handleSignOutSuccess)
//         .catchError(handleSignOutError);
//   }
// }

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final userLogedInProvider =
    Provider<bool>((ref) => ref.watch(authStateChangesProvider).value != null);

final usernameProvider = StateProvider<String>(
  (ref) =>
      ref.watch(authStateChangesProvider).value?.displayName ?? 'Anonymous',
);

final currentMenuProvider =
    StateProvider<AvailableMenus>((ref) => AvailableMenus.none);
