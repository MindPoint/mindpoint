import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mindpoint/components/molecules/PageScaffold/main.dart';
import 'package:mindpoint/components/templates/Welcome/main.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
    return PageScaffold(
      template: DSWelcomeTemplate(
        steps: const [
          DSWelcomeStepData(
            title: 'Bem vindo!',
            paragraphs: [
              'O Mind Point é um lugar para escrever tudo o que pensa de forma simples e fluida.',
            ],
          ),
          DSWelcomeStepData(
            title: 'Privado!',
            paragraphs: [
              'O Mind Point é só seu!',
              'Nenhuma informação é compartilhada com outros usuários ou empresas.',
            ],
          ),
          DSWelcomeStepData(
            title: 'Seguro!',
            paragraphs: [
              'Escreva o que quiser, da maneira que quiser e no tempo que quiser!',
              'Tudo é salvo e criptografado na nuvem, possibilidanto o acesso em qualquer lugar em qualquer dispositivo.',
            ],
          ),
        ],
        onFinish: () {},
      ),
    );
  }
}

// Define themes to be used on the App
@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();

// Define themes to be used on the App
@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => ThemeData.dark();
