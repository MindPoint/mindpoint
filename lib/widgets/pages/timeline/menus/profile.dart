import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';

import '../../../../constants/kinds.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/units.dart';
import '../../../../constants/wheights.dart';
import '../../../../data/providers/main.dart';
import '../../../atoms/button.dart';
import '../../../atoms/custom_icons.dart';
import '../../../atoms/typography.dart';

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

class TimelineProfileContent extends StatelessWidget {
  final bool logged;

  const TimelineProfileContent({
    super.key,
    required this.logged,
  });

  @override
  Widget build(BuildContext context) {
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
                    onTap: () => signInWithGoogle(),
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
