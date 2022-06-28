import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/hooks/debounce.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSEditableText extends HookWidget {
  final String initialText;

  ///
  final bool initializeFocused;

  /// The text style.
  final TextStyle? style;

  /// Is called when the user tries to create a new line and should return a
  /// boolean value that determines if the node will loose focus or not.
  final bool Function()? onNewLine;

  /// Is called when the data is updated
  final void Function(String data)? onChange;

  final FocusNode? focusNode;

  const DSEditableText({
    super.key,
    this.style,
    this.onChange,
    this.onNewLine,
    this.focusNode,
    this.initialText = '',
    this.initializeFocused = false,
  });

  @override
  Widget build(BuildContext context) {
    final debounce = useDebounce();
    final focusNodeController = focusNode ?? useFocusNode();
    final textEditingController = useTextEditingController.fromValue(
      initialText.isNotEmpty
          ? TextEditingValue(text: initialText)
          : TextEditingValue.empty,
    );

    useEffect(() {
      if (initializeFocused) focusNodeController.requestFocus();

      return null;
    }, []);

    return EditableText(
      maxLines: null,
      focusNode: focusNodeController,
      controller: textEditingController,
      keyboardType: TextInputType.multiline,
      cursorColor: const Color(0xFF000000),
      style: style ??
          DSTextStyle.create(
            size: DSTextSizes.s,
          ).style,
      textScaleFactor: 1,
      backgroundCursorColor: const Color(0xFFFF7D54),
      onChanged: (data) {
        final String lastDataChar = data[data.length - 1];
        final bool userIsTryingToCreateNewLine =
            RegExp('g\n|\r').hasMatch(lastDataChar) ||
                lastDataChar.codeUnitAt(0) == 10;

        // Checks if the parent node wants to lose focus or not when a user is
        // trying to create a new line
        final hasIntentToLoseFocus =
            userIsTryingToCreateNewLine ? onNewLine!() : false;

        if (userIsTryingToCreateNewLine && hasIntentToLoseFocus) {
          // Removes all new liners (\n's) from the string to do not trigger
          // the new line event if the user tries to eddit this text again.
          final normalizedData = data.trim().replaceAll(RegExp('g\n'), '');

          // Replaces the old text with the normalized one.
          textEditingController.text = normalizedData;

          // Lastly, call the onChange method to update the text.
          debounce(() => onChange!(normalizedData));

          focusNodeController.unfocus();

          return;
        }

        return debounce(() => onChange!(data));
      },
    );
  }
}

@notations.WidgetbookUseCase(
    name: 'Keeps focus on new line', type: DSEditableText)
Widget defaultDSEditableTextUseCase(BuildContext context) {
  WidgetsFlutterBinding.ensureInitialized();

  return DSEditableText(
    initialText: 'Keeps focus on new line',
    initializeFocused: true,
    onChange: (data) {
      print(data);
    },
    onNewLine: () {
      print('New Line');
      return false;
    },
  );
}

@notations.WidgetbookUseCase(
    name: 'Lose focus on new line', type: DSEditableText)
Widget loseFocusWhenNewLineDSEditableTextUseCase(BuildContext context) {
  WidgetsFlutterBinding.ensureInitialized();

  return DSEditableText(
    initialText: 'Lose focus on new line',
    initializeFocused: true,
    onChange: (data) {
      print(data);
    },
    onNewLine: () {
      print('New Line');
      return true;
    },
  );
}
