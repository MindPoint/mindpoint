import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/providers/main.dart';

import 'package:vibration/vibration.dart';

import '../../constants/colors.dart';
import '../../constants/kinds.dart';
import '../../constants/menus.dart';
import '../../constants/sizes.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';

import '../atoms/typography.dart';
import '../molecule/double_state_button.dart';
import '../molecule/thought_cta.dart';

Widget getAvatarText(String? username) {
  return CustomTypography(
    username?[0] ?? 'A',
    kind: Kind.primary,
    size: Sizes.small,
    wheight: Wheights.bold,
    color: CustomColors.white,
  );
}

Widget getAttachmentIcon(String? username) {
  return const Icon(
    Icons.attachment,
    size: Units.xxbig,
    color: CustomColors.black,
  );
}

Widget getCloseIcon(String? username) {
  return const Icon(
    Icons.close_sharp,
    size: Units.xxbig,
    color: CustomColors.black,
  );
}

class Footer extends HookConsumerWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final userIsOnProfileMenu = ref.watch(userIsOnProfileMenuProvider);
    final userIsOnAttachmentsMenu = ref.watch(userIsOnAttachmentsMenuProvider);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: CustomColors.black10,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Units.big,
        horizontal: Units.xxbig,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: GestureDetector(
              onTapDown: (details) {
                Vibration.vibrate(duration: 25);
                ref.read(currentMenuProvider.state).state = AvailableMenus.edit;
              },
              child: ThoughtCallToAction(
                currentThoughtData: ref.watch(currentThoughtDataProvider),
              ),
            ),
          ),

          const SizedBox(width: Units.small),

          // Attachment Button
          GestureDetector(
            onTapDown: (details) {
              ref.read(currentMenuProvider.state).state =
                  userIsOnAttachmentsMenu
                      ? AvailableMenus.none
                      : AvailableMenus.attachments;
            },
            child: DoubleStateButton(
              primaryChild: getAttachmentIcon(username),
              primaryKind: Kind.tertiary,
              secondaryChild: getCloseIcon(username),
              state: userIsOnAttachmentsMenu
                  ? DoubleStateButtonState.secondary
                  : DoubleStateButtonState.primary,
            ),
          ),

          const SizedBox(width: Units.small),

          // Avatar Button
          GestureDetector(
            onTapDown: (details) {
              ref.read(currentMenuProvider.state).state = userIsOnProfileMenu
                  ? AvailableMenus.none
                  : AvailableMenus.profile;
            },
            child: DoubleStateButton(
              primaryChild: getAvatarText(username),
              secondaryChild: getCloseIcon(username),
              state: userIsOnProfileMenu
                  ? DoubleStateButtonState.secondary
                  : DoubleStateButtonState.primary,
            ),
          ),
        ],
      ),
    );
  }
}
