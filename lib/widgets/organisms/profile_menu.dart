import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/widgets/molecule/icon_button.dart';

import '../../constants/colors.dart';
import '../../constants/menus.dart';
import '../../constants/sizes.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';
import '../../providers/main.dart';
import '../atoms/button.dart';
import '../atoms/custom_icons.dart';
import '../atoms/typography.dart';

/// ProfileMenu displays information and actions related to the current user,
class ProfileMenu extends HookConsumerWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);
    final userLogedIn = ref.watch(userLogedInProvider);

    final username = ref.watch(usernameProvider);
    final usernameFirstLetter = username[0].toUpperCase();

    /// Displays the button when the user is not logged in
    final signInWithGoogleButton = useMemoized(() {
      return !userLogedIn
          ? GestureDetector(
              onTap: () {
                signInWithGoogle(auth, GoogleSignIn());
              },
              child: Container(
                padding: const EdgeInsets.only(right: Units.small),
                child: const CustomIconButton(
                  label: 'Entrar com o Google',
                  icon: CustomIcons.googleLogo,
                ),
              ),
            )
          : Container();
    }, [userLogedIn]);

    final donationButton = useMemoized(() {
      return Container(
        padding: const EdgeInsets.only(right: Units.small),
        child: userLogedIn
            ? const CustomIconButton(
                label: 'Doação',
                icon: Icons.attach_money,
              )
            : const CustomIconButton(
                label: 'Doação',
                icon: Icons.attach_money,
                kind: Kind.secondary,
                color: CustomColors.black,
              ),
      );
    }, [userLogedIn]);

    final signOutButton = useMemoized(() {
      return userLogedIn
          ? GestureDetector(
              onTap: () {
                signOut(auth, GoogleSignIn());
              },
              child: Container(
                padding: const EdgeInsets.only(right: Units.small),
                child: const CustomIconButton(
                  label: 'Sair',
                  icon: Icons.logout,
                  kind: Kind.secondary,
                  color: CustomColors.black,
                ),
              ),
            )
          : Container();
    }, [userLogedIn]);

    final configButton = useMemoized(() {
      return Container(
        padding: const EdgeInsets.only(right: Units.small),
        child: const CustomIconButton(
          label: 'Configurações',
          icon: Icons.settings,
          kind: Kind.secondary,
          color: CustomColors.black,
        ),
      );
    }, [userLogedIn]);

    return Container(
      key: const ValueKey(AvailableMenus.profile),
      padding: const EdgeInsets.symmetric(
        vertical: Units.xxxxbig,
      ),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          // Avatar and username - ProfileMenuHeader
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Units.xxbig,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Button(
                  animate: false,
                  child: CustomTypography(
                    key: ValueKey(usernameFirstLetter),
                    usernameFirstLetter,
                    color: CustomColors.white,
                    wheight: Wheights.bold,
                  ),
                ),
                const SizedBox(width: Units.small),
                AnimatedSize(
                  duration: const Duration(milliseconds: 50),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: CustomTypography(
                      key: ValueKey(username),
                      username,
                      wheight: Wheights.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: Units.xxbig),

          // Actions related to the user - ProfileMenuActions
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: Units.xxbig,
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