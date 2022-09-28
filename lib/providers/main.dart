import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';

import '../models/thought_manager.dart';

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

final userLogedInProvider = Provider<bool>((ref) {
  final user = ref.watch(authStateChangesProvider).value;
  return user != null && !user.isAnonymous;
});

final usernameProvider = Provider<String>(
  (ref) {
    final user = ref.watch(authStateChangesProvider).value;

    // if (user != null &&
    //     (user.displayName == null || user.displayName!.isEmpty)) {
    //   return 'Anonymous User';
    // }

    if (user != null &&
        user.displayName != null &&
        user.displayName!.isNotEmpty) {
      return user.displayName as String;
    }

    return 'Anonymous';
  },
);

final currentThoughtDataProvider = StateProvider<String>((ref) => '');

final currentMenuProvider =
    StateProvider<AvailableMenus>((ref) => AvailableMenus.none);

final userIsOnAnyKindOfMenu = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) != AvailableMenus.none);

final userIsOnEditMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == AvailableMenus.edit);

final userIsOnProfileMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == AvailableMenus.profile);

final userIsOnAttachmentsMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == AvailableMenus.attachments);
