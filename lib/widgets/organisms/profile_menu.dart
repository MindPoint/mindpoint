import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final username = ref.watch(usernameProvider);
    final usernameFirstLetter = username[0].toUpperCase();

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
                    usernameFirstLetter,
                    color: CustomColors.white,
                    wheight: Wheights.bold,
                  ),
                ),
                const SizedBox(width: Units.small),
                CustomTypography(
                  username,
                  wheight: Wheights.bold,
                ),
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
              children: const [
                // Login Button
                CustomIconButton(
                  label: 'Entrar com o Google',
                  icon: CustomIcons.googleLogo,
                ),
                SizedBox(width: Units.small),
                CustomIconButton(
                  label: 'Doação',
                  icon: Icons.attach_money,
                ),
                SizedBox(width: Units.small),
                CustomIconButton(
                  label: 'Dark mode',
                  icon: Icons.dark_mode,
                  kind: Kind.secondary,
                  color: CustomColors.black,
                ),
                SizedBox(width: Units.small),
                CustomIconButton(
                  label: 'Configurações',
                  icon: Icons.settings,
                  kind: Kind.secondary,
                  color: CustomColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
