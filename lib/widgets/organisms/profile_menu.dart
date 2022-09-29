import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/sizes.dart';

import '../../constants/kinds.dart';
import '../../constants/menus.dart';
import '../../constants/units.dart';
import '../../constants/colors.dart';
import '../../constants/wheights.dart';

import '../../data/providers/main.dart';

import '../atoms/button.dart';
import '../atoms/typography.dart';
import '../atoms/custom_icons.dart';

/// ProfileMenu displays information and actions related to the current user,
class ProfileMenu extends HookConsumerWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLogedIn = ref.watch(userLogedInProvider);

    final username = ref.watch(usernameProvider);
    final usernameFirstLetter = username[0].toUpperCase();

    /// Displays the button when the user is not logged in
    final signInWithGoogleButton = useMemoized(() {
      return !userLogedIn
          ? GestureDetector(
              onTap: () => signInWithGoogle(),
              child: Container(
                padding: const EdgeInsets.only(right: KUnits.small),
                child: AButton(
                  child: ATypography.withIcon(
                    'Entrar com o Google',
                    CustomIcons.googleLogo,
                    color: KColors.white,
                    wheight: KWheights.medium,
                    size: KSizes.smallest,
                  ),
                ),
              ),
            )
          : Container();
    }, [userLogedIn]);

    final signOutButton = useMemoized(() {
      return userLogedIn
          ? GestureDetector(
              onTap: () => signOut(),
              child: Container(
                padding: const EdgeInsets.only(right: KUnits.small),
                child: AButton(
                  kind: KKind.secondary,
                  child: ATypography.withIcon(
                    'Sair',
                    Icons.logout,
                    wheight: KWheights.medium,
                    size: KSizes.smallest,
                  ),
                ),
              ),
            )
          : Container();
    }, [userLogedIn]);

    return Container(
      key: const ValueKey(KAvailableMenus.profile),
      padding: const EdgeInsets.symmetric(
        vertical: KUnits.xxxxbig,
      ),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          // Avatar and username - ProfileMenuHeader
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KUnits.xxbig,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                AButton(
                  animate: false,
                  child: ATypography(
                    key: ValueKey(usernameFirstLetter),
                    usernameFirstLetter,
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
          ),

          const SizedBox(height: KUnits.xxbig),

          // Actions related to the user - ProfileMenuActions
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: KUnits.xxbig,
            ),
            child: Row(
              children: [
                signInWithGoogleButton,
                // donationButton,
                // configButton,
                signOutButton,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
