import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

const TextStyle defaultTextStyle =
    TextStyle(color: Color.fromRGBO(255, 255, 255, 1), height: 10);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => WidgetsApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'GoRouter Example',
      color: Colors.white);

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Page(
          target: '/page2',
        ),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) => Page(
          target: '/',
        ),
      ),
    ],
  );
}

class Page extends StatelessWidget {
  String target = '';

  Page({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          GoRouter.of(context).go(target);
        },
        child: Text(
          'Click Me to go to: $target',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
