import 'dart:developer';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth.dart';

final userLogedInProvider = Provider<bool>((ref) {
  final user = ref.watch(authStateChangesProvider).value;
  return user != null && !user.isAnonymous;
});

final usernameProvider = Provider<String>(
  (ref) {
    final user = ref.watch(authStateChangesProvider).value;

    if (user != null &&
        user.displayName != null &&
        user.displayName!.isNotEmpty) {
      return user.displayName as String;
    }

    return '';
  },
);

String generateUserUniqueHash(User? user) {
  final uid = user?.uid;

  final bytes = utf8.encode(uid ?? 'DEFAULT_KEY'); // data being hashed
  final digest = sha256.convert(bytes);

  return digest.toString();
}
