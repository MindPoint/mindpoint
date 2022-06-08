import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/pages/Welcome/main.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}

@WidgetbookApp.material(
  name: 'Mind Point',
  frames: [
    WidgetbookFrame(
      name: 'Widgetbook',
      allowsDevices: true,
    ),
  ],
  devices: [],
  textScaleFactors: [1],
  foldersExpanded: true,
  widgetsExpanded: true,
  constructor: WidgetbookConstructor.custom,
)
class App extends HookWidget {
  App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetsApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Mind Point',
      color: Colors.white,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/welcome',
    routes: <GoRoute>[
      GoRoute(
        path: '/welcome',
        builder: (BuildContext context, GoRouterState state) => DSWelcomePage(
          onFinishWelcome: () {
            GoRouter.of(context).go('/login');
          },
        ),
      ),
    ],
  );
}

// Define themes to be used on the App
@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();

// Define themes to be used on the App
@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => ThemeData.dark();
