import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/units.dart';

import '../../providers/main.dart';

int getCursorOffset(
  String currentData,
  int currentOffset,
  String incomingData,
) {
  final cursorWasAtTheEnd = currentData.length == currentOffset;

  if (cursorWasAtTheEnd) return incomingData.length;

  if (currentOffset > incomingData.length) return incomingData.length;

  return currentOffset;
}

class ThoughtMenu extends HookConsumerWidget {
  const ThoughtMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();
    final currentThoughtData = ref.watch(currentThoughtDataProvider);

    useEffect(() {
      final currentData = textController.text;
      final currentOffset = textController.selection.baseOffset;
      final incomingData = currentThoughtData;

      final offset = getCursorOffset(currentData, currentOffset, incomingData);

      textController.value = TextEditingValue(
        selection: TextSelection(
          baseOffset: offset,
          extentOffset: offset,
        ),
        text: currentThoughtData,
      );

      return null;
    }, [currentThoughtData]);

    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        height: 160,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: EditableText(
                onChanged: (value) {
                  ref.read(currentThoughtDataProvider.notifier).change(value);
                },
                autofocus: true,
                focusNode: focusNode,
                controller: textController,
                keyboardType: TextInputType.multiline,
                minLines: null,
                maxLines: null,
                expands: true,
                style: GoogleFonts.robotoSerif(
                  color: CustomColors.black,
                  fontSize: Units.xbig,
                  height: 1.2,
                ),
                textScaleFactor: 1,
                cursorColor: CustomColors.black,
                backgroundCursorColor: CustomColors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
