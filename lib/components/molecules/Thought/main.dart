import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/EditableText/main.dart';
import 'package:mindpoint/data/models/thought_model.dart';
import 'package:mindpoint/styles/colors/main.dart';

// ignore: unused_import
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSEditableTextThought extends HookWidget {
  final ThoughtModel _thought;
  final void Function(String id, String data) _onChange;
  final void Function() _onNewLine;

  const DSEditableTextThought({
    super.key,
    required thought,
    required onChange,
    required onNewLine,
  })  : _thought = thought,
        _onChange = onChange,
        _onNewLine = onNewLine;

  @override
  Widget build(BuildContext context) {
    final focusNodeController = useFocusNode();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        if (!focusNodeController.hasFocus) focusNodeController.requestFocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: DSEditableText(
          initialText: _thought.data,
          focusNode: focusNodeController,
          onChange: (data) {
            _onChange(_thought.id ?? '', data);
          },
          onNewLine: () {
            _onNewLine();
            return true;
          },
        ),
      ),
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSEditableTextThought)
Widget defaultDSEditableThoughtUseCase(BuildContext context) {
  return DSEditableTextThought(
    thought: ThoughtModel(
      id: '123',
      data: 'teste',
      type: ThoughtType.text,
      edited: DateTime.now(),
      created: DateTime.now(),
    ),
    onChange: (id, data) {
      print('$id $data');
    },
    onNewLine: () {
      print('new line garaio');
    },
  );
}
