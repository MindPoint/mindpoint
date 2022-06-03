import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindpoint/components/atoms/Step/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';

import 'package:mindpoint/components/molecules/PageScaffold/main.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

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
    return PageScaffold(children: [
      Row(
        children: const [
          StepBullet(
            state: StepBulletState.active,
          ),
          StepBullet(
            state: StepBulletState.inactive,
          ),
        ],
      ),
      const DSText(
        'Lorem Ipsum',
        wheight: DSTextWheights.light,
      ),
      const DSText(
        'Lorem Ipsum',
        wheight: DSTextWheights.regular,
      ),
      const DSText(
        'Lorem Ipsum',
        wheight: DSTextWheights.medium,
      ),
      const DSText(
        'Lorem Ipsum',
        wheight: DSTextWheights.bold,
      ),
      Row(
        children: [
          Column(
            children: [
              DSButton(
                size: DSButtonSizes.medium,
                shape: DSButtonShapes.squared,
                variation: DSButtonVariations.primary,
                onTap: () {
                  print('batata');
                },
              )
            ],
          )
        ],
      ),
    ]);
  }
}
