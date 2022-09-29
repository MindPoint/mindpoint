import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/hooks/keyboard_visibility.dart';

import '../../data/models/node.dart';
import '../../methods/node.dart';
import '../../providers/main.dart';

class EditMenu extends HookConsumerWidget {
  const EditMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();

    final user = ref.watch(authStateChangesProvider).value;
    final currentThoughtData = ref.watch(currentThoughtDataProvider);

    useEffect(() {
      final currentData = textController.text;
      final incomingData = currentThoughtData;

      // This should trigger when the user closed the editing window and it is
      // returning to it to keep editing;
      if (currentData.isEmpty && incomingData.isNotEmpty) {
        textController.text = incomingData;
      }

      // This should trigger when the user submited or reseted the data from other
      // place in the application;
      if (currentData.isNotEmpty && incomingData.isEmpty) {
        textController.text = incomingData;
      }

      return null;
    }, [currentThoughtData]);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      height: 120,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: TextField(
              focusNode: focusNode,
              controller: textController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (data) {
                // The data that the user is typing should be posted when it tries
                // to create a new line. So we need to check if the las char is a
                // line break ('\r').
                // This decision was made beacause the space the user have to
                // type is limited, so, we need to prevent the user to write bigger
                // texts, breaking it in paragraphs.
                final userIsCreatingANewLine = data.endsWith('\n');

                if (userIsCreatingANewLine) {
                  addNode(
                    user!,
                    Node(
                      type: NodeTypes.text,
                      data: currentThoughtData.trim(),
                      timestamp: DateTime.now(),
                    ),
                  );

                  ref.read(currentThoughtDataProvider.state).state = '';
                } else {
                  ref.read(currentThoughtDataProvider.state).state = data;
                }
              },
              autofocus: true,
              autocorrect: true,
              cursorColor: KColors.black,
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0),
                hintText: 'No que está pensando?',
                hintStyle: GoogleFonts.poppins(
                  fontSize: KUnits.xbig,
                ),
              ),
              style: GoogleFonts.robotoSerif(
                color: KColors.black,
                fontSize: KUnits.xbig,
                height: 1.2,
              ),
            ),
          );
        },
      ),
    );
  }
}
