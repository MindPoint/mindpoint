import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vibration/vibration.dart';

import '../../constants/colors.dart';
import '../../constants/kinds.dart';
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
  final String? username;
  final String? currentThoughtData;
  final bool? isProfileMenuOpen;
  final bool? isAttachmentsMenuOpen;

  const Footer({
    super.key,
    this.username,
    this.currentThoughtData,
    this.isProfileMenuOpen,
    this.isAttachmentsMenuOpen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              },
              child: ThoughtCallToAction(
                currentThoughtData: currentThoughtData,
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Attachment Button
          GestureDetector(
            onTapDown: (details) {
              Vibration.vibrate(duration: 25);
            },
            child: DoubleStateButton(
              primaryChild: getAttachmentIcon(username),
              primaryKind: Kind.tertiary,
              secondaryChild: getCloseIcon(username),
              state: isAttachmentsMenuOpen!
                  ? DoubleStateButtonState.secondary
                  : DoubleStateButtonState.primary,
            ),
          ),

          const SizedBox(width: 8),

          // Avatar Button
          GestureDetector(
            onTapDown: (details) {
              Vibration.vibrate(duration: 25);
            },
            child: DoubleStateButton(
              primaryChild: getAvatarText(username),
              secondaryChild: getCloseIcon(username),
              state: isProfileMenuOpen!
                  ? DoubleStateButtonState.secondary
                  : DoubleStateButtonState.primary,
            ),
          ),
        ],
      ),
    );
  }
}
