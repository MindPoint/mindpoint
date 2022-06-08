import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../molecules/PageScaffold/main.dart';
import '../../templates/Welcome/main.dart';

// ignore: depend_on_referenced_packages
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSWelcomePage extends HookWidget {
  final void Function() onFinishWelcome;

  const DSWelcomePage({
    super.key,
    required this.onFinishWelcome,
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

@notations.WidgetbookUseCase(name: 'Default', type: DSWelcomePage)
Widget defaultDSWelcomePageUseCase(BuildContext context) {
  return DSWelcomePage(
    onFinishWelcome: () {},
  );
}
