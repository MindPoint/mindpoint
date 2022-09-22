import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindpoint/widgets/pages/timeline.dart';

class RouteNames {
  RouteNames._();

  static const timeline = '/timeline';
}

GoRouter createRouterInstance() => GoRouter(
      initialLocation: RouteNames.timeline,
      routes: <GoRoute>[
        GoRoute(
          path: RouteNames.timeline,
          builder: (BuildContext context, GoRouterState state) =>
              const TimelinePage(),
        )
      ],
    );
