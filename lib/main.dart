import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mindpoint/components/molecules/PageScaffold/main.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart';

void main() {
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
  textScaleFactors: [
    1,
    2,
    3,
  ],
  foldersExpanded: true,
  widgetsExpanded: true,
  constructor: WidgetbookConstructor.custom,
)
class App extends StatelessWidget {
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
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Page(),
      ),
    ],
  );
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageScaffold(children: []);
  }
}

// Define themes to be used on the App
@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();

// Define themes to be used on the App
@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => ThemeData.dark();
