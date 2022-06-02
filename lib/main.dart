import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindpoint/components/atoms/Step/main.dart';
import 'package:mindpoint/components/atoms/Typography/Heading/main.dart';
import 'package:mindpoint/components/atoms/Typography/Label/main.dart';
import 'package:mindpoint/components/atoms/Typography/Paragraph/main.dart';
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
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: const Heading(data: 'Bem vindo!'),
      ),

      /// Paragraph
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: const Paragraph(
          data:
              'O Mind Point é um lugar para escrever tudo o que pensa de forma simples e fluida.',
          variation: ParagraphVariation.medium,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: const Paragraph(
          data:
              'O Mind Point é um lugar para escrever tudo o que pensa de forma simples e fluida.',
          variation: ParagraphVariation.small,
        ),
      ),

      /// Label
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: const DSLabel(
          data:
              'O Mind Point é um lugar para escrever tudo o que pensa de forma simples e fluida.',
          size: DSLabelSize.big,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: const DSLabel(
          data:
              'O Mind Point é um lugar para escrever tudo o que pensa de forma simples e fluida.',
          size: DSLabelSize.medium,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: const DSLabel(
          data:
              'O Mind Point é um lugar para escrever tudo o que pensa de forma simples e fluida.',
          size: DSLabelSize.small,
        ),
      ),
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
