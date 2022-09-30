import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';
import 'package:mindpoint/constants/sizes.dart';
import 'package:mindpoint/hooks/keyboard_visibility.dart';
import 'package:mindpoint/widgets/atoms/button.dart';
import 'package:mindpoint/widgets/atoms/typography.dart';

import '../../../../constants/colors.dart';
import '../../../../data/models/node.dart';
import '../../../../data/providers/main.dart';

class TimelineEditFooter extends HookConsumerWidget {
  const TimelineEditFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    final currentThoughtData = ref.watch(currentThoughtDataProvider);

    // Forces this menu to close when the keyboard is not visible.
    useKeyBoardVisibility((visible) {
      if (visible) return;

      ref.read(currentMenuProvider.state).state = KAvailableMenus.none;
    });

    return Flex(
      direction: Axis.horizontal,
      children: [
        // Forces the Save button to the end
        Expanded(child: Container()),

        // Save Button
        AButton(
          onTap: () {
            if (ref.read(currentThoughtDataProvider).isEmpty) return;

            addNode(
              user!,
              FirestoreNode(
                type: FirestoreNodeTypes.text,
                data: currentThoughtData,
                timestamp: DateTime.now(),
              ),
            );

            ref.read(currentThoughtDataProvider.state).state = '';
          },
          disabled: currentThoughtData.isEmpty,
          child: ATypography.withIcon(
            'Salvar',
            Icons.keyboard_return,
            color: KColors.white,
            size: KSizes.smallest,
          ),
        ),
      ],
    );
  }
}
