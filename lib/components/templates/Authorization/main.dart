import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSAuthorizationTemplate extends HookWidget {
  const DSAuthorizationTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: DSColor.white);
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSAuthorizationTemplate)
Widget defaultDSWelcomeTemplateUseCase(BuildContext context) {
  return const DSAuthorizationTemplate();
}
