import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:mindpoint/data/providers/messaging.dart';
import 'package:mindpoint/data/providers/notification.dart';

import 'package:mindpoint/router/main.dart';
import 'package:mindpoint/constants/colors.dart';

import 'firebase_options.dart';

// Intializes the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await container.read(notificationProvider).init();
  await container.read(messagingProvider).init();

  runApp(
    // Initializes the app with a riverpod scope
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The title of the app.
    const String title = 'Mind Point';

    // Initialize the router to be able to navigate throught the app
    final router = useMemoized<GoRouter>(() => createRouterInstance(), []);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: title,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: KColors.black,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: KColors.black,
          selectionHandleColor: KColors.black50,
          selectionColor: KColors.gray100,
        ),
      ),
    );
  }
}
