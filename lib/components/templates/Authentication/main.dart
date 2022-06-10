import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/CustomIcons/main.dart';

import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';

// ignore: unused_import
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSAuthenticationTemplate extends HookWidget {
  final void Function()? onLoginTap;

  const DSAuthenticationTemplate({
    super.key,
    this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 120, left: 16, right: 16, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DSText(
            'Quase lá!',
            size: DSTextSizes.xg,
            wheight: DSTextWheights.bold,
          ),
          const SizedBox(
            height: 12,
          ),
          const DSText('Escolha a maneira que deseja se identificar'),
          const SizedBox(
            height: 40,
          ),
          DSButton(
            'Continuar com o Google',
            size: DSButtonSizes.big,
            icon: DSCustomIcons.googleLogo,
            onTap: onLoginTap,
          )
        ],
      ),
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSAuthenticationTemplate)
Widget defaultDSAuthorizationTemplateUseCase(BuildContext context) {
  return DSAuthenticationTemplate(
    onLoginTap: () {
      print('tap on login');
    },
  );
}
