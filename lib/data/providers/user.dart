import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth.dart';

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

    return '';
  },
);
