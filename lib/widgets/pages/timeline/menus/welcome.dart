import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/widgets/molecule/menu.dart';
import 'package:mindpoint/widgets/molecule/section.dart';

import '../../../../constants/menus.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/wheights.dart';
import '../../../../data/providers/main.dart';
import '../../../atoms/button.dart';
import '../../../atoms/typography.dart';

class TimelineWelcomeMenu extends HookConsumerWidget {
  const TimelineWelcomeMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MMenuWrapper(
      child: MSection(
        label: ATypography(
          AppLocalizations.of(context)!.welcomeMenuLabel,
          wheight: KWheights.medium,
        ),
        content: [
          ...AppLocalizations.of(context)!
              .welcomeMenuContent
              .split('\n')
              .map((paragraph) => ATypography(
                    paragraph,
                    wheight: KWheights.regular,
                    overflow: TextOverflow.visible,
                  ))
              .toList(),
        ],
        actions: [
          AButton(
            onTap: () async {
              ref.read(currentMenuProvider.state).state = KAvailableMenus.none;
            },
            child: ATypography.withIcon(
              AppLocalizations.of(context)!.welcomeMenuConfirmAction,
              Icons.done,
              color: KColors.white,
              wheight: KWheights.medium,
              size: KSizes.smallest,
            ),
          ),
        ],
      ),
    );
  }
}
