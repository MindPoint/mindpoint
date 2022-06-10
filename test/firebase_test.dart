import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindpoint/firebase_options.dart';

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}

void main() {
  group('Counter', () {
    test('Counter value should be incremented', () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

      // FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //   if (user == null) {
      //     print('User is currently signed out!');
      //   } else {
      //     print('User is signed in!');
      //   }
      // });
    });
  });
}
