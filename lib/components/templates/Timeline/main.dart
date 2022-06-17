import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/Avatar/main.dart';
import 'package:mindpoint/components/molecules/AppBar/main.dart';
import 'package:mindpoint/data/models/thought_model.dart';

// ignore: unused_import
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

import '../../molecules/Button/main.dart';

class DSTimelineTemplate extends HookWidget {
  final String _username;
  final String _buttonLabel;

  final List<ThoughtModel> _thoughts;

  const DSTimelineTemplate({
    super.key,
    required String username,
    required String buttonLabel,
    required List<ThoughtModel> thoughts,
  })  : _username = username,
        _thoughts = thoughts,
        _buttonLabel = buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DSAppBar(
          avatar: DSAvatar(_username),
          children: [
            DSButton(
              _buttonLabel,
              icon: Icons.calendar_today_rounded,
              size: DSButtonSizes.small,
              shape: DSButtonShapes.round,
              kind: DSButtonKinds.tertiary,
            )
          ],
        ),
        Scrollable(
          viewportBuilder: (context, position) => Column(
            children: [],
          ),
        ),
      ],
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSTimelineTemplate)
Widget defaultDSTimelineTemplateUseCase(BuildContext context) {
  final username = context.knobs.text(
    label: 'Username',
    description:
        'This data is used to define the letter that will appear in the [DSAvatar] component.',
    initialValue: 'Foo',
  );

  final buttonLabel = context.knobs.options(
    label: 'Button Label',
    description: 'This data defines the label of the button with the callendar',
    options: const [
      Option(label: 'Today', value: 'TODAY'),
      Option(label: 'Yesterday', value: 'YESTERDAY'),
      Option(label: 'Hoje', value: 'HOJE'),
      Option(label: 'Ontem', value: 'ONTEM'),
      Option(label: 'Other', value: '26/10/1996'),
    ],
  );

  return DSTimelineTemplate(
    username: username,
    buttonLabel: buttonLabel,
    thoughts: [],
  );
}
