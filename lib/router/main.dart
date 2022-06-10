import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../components/pages/Login/main.dart';
import 'package:mindpoint/components/pages/Welcome/main.dart';
import 'package:mindpoint/components/pages/Timeline/main.dart';

class RouteNames {
  RouteNames._();

  static const onboarding = '/onboarding';
  static const authentication = '/authentication';
  static const timeline = '/timeline';
}

GoRouter createRouterInstance() => GoRouter(
      initialLocation: RouteNames.onboarding,
      routes: <GoRoute>[
        GoRoute(
          path: RouteNames.onboarding,
          builder: (BuildContext context, GoRouterState state) => DSWelcomePage(
            onFinishWelcome: (context) {
              context.go(RouteNames.authentication);
            },
          ),
        ),
        GoRoute(
          path: RouteNames.authentication,
          builder: (BuildContext context, GoRouterState state) =>
              const DSAuthPage(),
        ),
        GoRoute(
          path: RouteNames.timeline,
          builder: (BuildContext context, GoRouterState state) =>
              const DSTimelinePage(),
        ),
      ],
    );
