import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/Avatar/main.dart';
import 'package:mindpoint/components/atoms/EditableText/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/AppBar/main.dart';
import 'package:mindpoint/components/molecules/Thought/main.dart';
import 'package:mindpoint/data/models/thought_model.dart';
import 'package:mindpoint/styles/colors/main.dart';

// ignore: unused_import
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

import '../../molecules/Button/main.dart';

class DSTimelineTemplate extends HookWidget {
  final String _username;

  final List<Widget> _children;

  const DSTimelineTemplate({
    super.key,
    required String username,
    required List<Widget> children,
  })  : _username = username,
        _children = children;

  // Widget initializeCorrectThoughtWidget(ThoughtModel thought) {
  //   switch (thought.type) {
  //     case ThoughtType.text:
  //       return DSEditableTextThought(
  //         thought: thought,
  //         onChange: (id, data) {
  //           print('$id $data');
  //         },
  //         onNewLine: () {
  //           print('${thought.id} new line');
  //         },
  //       );
  //     default:
  //       return const DSText('something gone wrong');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final List<Widget> thoughts = _thoughts
    //     .map((thought) => initializeCorrectThoughtWidget(thought))
    //     .toList()
    //     .cast();

    return Column(
      children: [
        Expanded(
          child: Container(
            color: DSColor.gray40,
            child: ListView.separated(
              itemCount: _children.length,
              itemBuilder: (context, index) => _children[index],
              separatorBuilder: (context, index) => const SizedBox(height: 4),
            ),
          ),
        ),
        DSAppBar(
          avatar: DSAvatar(_username),
          children: const [],
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

  return DSTimelineTemplate(
    username: username,
    children: const [
      DSText('foo'),
      DSText('bar'),
    ],
  );
}
