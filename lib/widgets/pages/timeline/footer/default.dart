import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/kinds.dart';
import '../../../../constants/menus.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/units.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/wheights.dart';

import '../../../atoms/button.dart';
import '../../../atoms/typography.dart';

import '../../../../data/providers/main.dart';

class TimelineDefaultFooter extends HookConsumerWidget {
  const TimelineDefaultFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final currentMenu = ref.watch(currentMenuProvider);
    final currentThoughtData = ref.watch(currentThoughtDataProvider);

    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Vibration.vibrate(duration: 15);
              ref.read(currentMenuProvider.state).state = KAvailableMenus.edit;
            },
            // Ensures the Gesture Detector will detect all the area of the text
            child: Container(
              constraints: const BoxConstraints.expand(),
              color: KColors.transparent,
              child: currentThoughtData.isEmpty
                  // Displays a call to action text when the user hasn't typed any
                  // kind of data
                  ? const Align(
                      alignment: Alignment.centerLeft,
                      child: ATypography(
                        'No que está pensando?',
                        kind: KKind.secondary,
                      ),
                    )

                  // Displays a call to action text to estimulate the user to continue
                  // writing
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ATypography(
                          'Rascunho:',
                          kind: KKind.secondary,
                          wheight: KWheights.medium,
                        ),
                        const SizedBox(width: KUnits.xxsmall),
                        ATypography(
                          currentThoughtData,
                          kind: KKind.secondary,
                          wheight: KWheights.regular,
                        ),
                      ],
                    ),
            ),
          ),
        ),

        const SizedBox(width: KUnits.small),

        // Avatar Button
        AButton.withStates(
          state: currentMenu,
          states: {
            // Displays the first letter of the current username
            KAvailableMenus.none: AButtonState(
              child: ATypography(
                username[0],
                kind: KKind.primary,
                size: KSizes.small,
                wheight: KWheights.bold,
                color: KColors.white,
              ),
              kind: KKind.primary,
              onTap: () => ref.read(currentMenuProvider.state).state =
                  KAvailableMenus.profile,
            ),

            // Displays the close icon to close the current menu
            KAvailableMenus.profile: AButtonState(
              child: const Icon(
                Icons.close_sharp,
                size: KUnits.xxbig,
                color: KColors.black,
              ),
              kind: KKind.secondary,
              onTap: () => ref.read(currentMenuProvider.state).state =
                  KAvailableMenus.none,
            ),

            // Displays the close icon to close the current menu
            KAvailableMenus.merge: AButtonState(
              child: const Icon(
                Icons.close_sharp,
                size: KUnits.xxbig,
                color: KColors.black,
              ),
              kind: KKind.secondary,
              onTap: () => ref.read(currentMenuProvider.state).state =
                  KAvailableMenus.none,
            ),

            KAvailableMenus.edit: const AButtonState(),
          },
        ),
      ],
    );
  }
}
