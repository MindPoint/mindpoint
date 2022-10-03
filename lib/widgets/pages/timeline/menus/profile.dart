import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';

import '../../../../constants/kinds.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/units.dart';
import '../../../../constants/wheights.dart';
import '../../../../data/providers/main.dart';
import '../../../atoms/button.dart';
import '../../../atoms/custom_icons.dart';
import '../../../atoms/typography.dart';

/// Wraps all content for the current Menu
class TimelineProfileMenu extends HookConsumerWidget {
  const TimelineProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logged = ref.watch(userLogedInProvider);
    final username = ref.watch(usernameProvider);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: KColors.black10,
            strokeAlign: StrokeAlign.inside,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        // horizontal: KUnits.xxbig,
        vertical: KUnits.xxxxbig,
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimelineProfileHeader(
            username: username,
          ),
          const SizedBox(height: KUnits.xxbig),
          TimelineProfileContent(
            logged: logged,
          )
        ],
      ),
    );
  }
}

/// Displays the header with the Username initial and the current username
class TimelineProfileHeader extends StatelessWidget {
  final String username;

  const TimelineProfileHeader({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KUnits.xxbig,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          AButton(
            animate: false,
            child: ATypography(
              key: ValueKey(username),
              username[0].toUpperCase(),
              color: KColors.white,
              wheight: KWheights.bold,
            ),
          ),
          const SizedBox(width: KUnits.small),
          AnimatedSize(
            duration: const Duration(milliseconds: 50),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ATypography(
                key: ValueKey(username),
                username,
                wheight: KWheights.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// Displays all the current menu buttons
class TimelineProfileContent extends HookConsumerWidget {
  final bool logged;

  const TimelineProfileContent({
    super.key,
    required this.logged,
  });

  @override
  Widget build(BuildContext context, ref) {
    final nodesProvider = ref.watch(nodesClassProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: KUnits.xxbig,
      ),
      child: Row(
        // TODO: Should wrapp these buttons on it own Statelles Widgets.
        children: [
          // Login Button
          !logged
              ? Container(
                  padding: const EdgeInsets.only(right: KUnits.small),
                  child: AButton(
                    onTap: () async {
                      if (nodesProvider.nodes.isNotEmpty) {
                        ref.read(currentMenuProvider.state).state =
                            KAvailableMenus.merge;
                      } else {
                        await signInWithGoogle();

                        ref.read(currentMenuProvider.state).state =
                            KAvailableMenus.none;
                      }
                    },
                    child: ATypography.withIcon(
                      'Entrar com o Google',
                      CustomIcons.googleLogo,
                      color: KColors.white,
                      wheight: KWheights.medium,
                      size: KSizes.smallest,
                    ),
                  ),
                )
              : Container(),

          // Logout Button
          logged
              ? Container(
                  margin: const EdgeInsets.only(right: KUnits.small),
                  child: AButton(
                    onTap: () => signOut(),
                    kind: KKind.secondary,
                    child: ATypography.withIcon(
                      'Sair',
                      Icons.logout,
                      wheight: KWheights.medium,
                      size: KSizes.smallest,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
