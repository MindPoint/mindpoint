import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/methods/node.dart';
import 'package:mindpoint/providers/main.dart';

import 'package:vibration/vibration.dart';

import '../../constants/colors.dart';
import '../../constants/kinds.dart';
import '../../constants/menus.dart';
import '../../constants/sizes.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';

import '../../hooks/keyboard_visibility.dart';
import '../atoms/typography.dart';
import '../molecule/double_state_button.dart';
import '../molecule/icon_button.dart';
import '../molecule/thought_cta.dart';

Widget getAvatarText(String username) {
  return CustomTypography(
    username[0],
    kind: KKind.primary,
    size: KSizes.small,
    wheight: KWheights.bold,
    color: KColors.white,
  );
}

Widget getAttachmentIcon(String? username) {
  return const Icon(
    Icons.attachment,
    size: KUnits.xxbig,
    color: KColors.black,
  );
}

Widget getCloseIcon(String? username) {
  return const Icon(
    Icons.close_sharp,
    size: KUnits.xxbig,
    color: KColors.black,
  );
}

class Footer extends HookConsumerWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMenu = ref.watch(currentMenuProvider);

    useKeyBoardVisibility((visible) {
      log('keyboard is visible $visible');

      if (!visible) {
        ref.read(currentMenuProvider.state).state = KAvailableMenus.none;
      }
    });

    final currentFooter = useMemoized(() {
      switch (currentMenu) {
        case KAvailableMenus.edit:
          return const EditActionsFooter(
            key: ValueKey('EditActionsFooter'),
          );
        default:
          return const DefaultFooter(
            key: ValueKey('DefaultFooter'),
          );
      }
    }, [currentMenu]);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: currentFooter,
    );
  }
}

class EditActionsFooter extends HookConsumerWidget {
  const EditActionsFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    final currentThoughtData = ref.watch(currentThoughtDataProvider);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: KColors.black10,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: KUnits.big,
        horizontal: KUnits.xxbig,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          // Forces the Save button to the end
          Expanded(child: Container()),

          // Save Button
          GestureDetector(
            onTap: () {
              if (ref.read(currentThoughtDataProvider).isNotEmpty) {
                addNode(
                  user!,
                  Node(
                    type: NodeTypes.text,
                    data: currentThoughtData,
                    timestamp: DateTime.now(),
                  ),
                );
              }

              ref.read(currentThoughtDataProvider.state).state = '';
            },
            child: CustomIconButton(
              label: 'Salvar',
              icon: Icons.keyboard_return,
              disabled: currentThoughtData.isEmpty && user != null,
            ),
          )
        ],
      ),
    );
  }
}

class DefaultFooter extends HookConsumerWidget {
  const DefaultFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final userIsOnProfileMenu = ref.watch(userIsOnProfileMenuProvider);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: KColors.black10,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: KUnits.big,
        horizontal: KUnits.xxbig,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: GestureDetector(
              onTapDown: (details) {
                Vibration.vibrate(duration: 25);
                ref.read(currentMenuProvider.state).state =
                    KAvailableMenus.edit;
              },
              child: const ThoughtCallToAction(),
            ),
          ),
          const SizedBox(width: KUnits.small),
          GestureDetector(
            onTapDown: (details) {
              ref.read(currentMenuProvider.state).state = userIsOnProfileMenu
                  ? KAvailableMenus.none
                  : KAvailableMenus.profile;
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
