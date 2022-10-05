import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/widgets/molecule/menu.dart';
import 'package:mindpoint/widgets/molecule/section.dart';

import '../../../../constants/menus.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/wheights.dart';
import '../../../../data/providers/main.dart';
import '../../../atoms/button.dart';
import '../../../atoms/typography.dart';

class TimelineMergeMenu extends HookConsumerWidget {
  const TimelineMergeMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodesProvider = ref.watch(nodesClassProvider);

    return MMenuWrapper(
      child: MSection(
        label: ATypography.withIcon(
          AppLocalizations.of(context)!.mergeMenuLabel,
          Icons.warning_rounded,
          wheight: KWheights.medium,
        ),
        content: [
          ...AppLocalizations.of(context)!
              .mergeMenuContent
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
              final nodesToMerge = [...nodesProvider.nodes];

              await signInWithGoogle();

              for (var node in nodesToMerge) {
                await addNode(FirebaseAuth.instance.currentUser, node);
              }

              ref.read(currentMenuProvider.state).state = KAvailableMenus.none;
            },
            child: ATypography.withIcon(
              AppLocalizations.of(context)!.mergeMenuConfirmAction,
              Icons.done,
              color: KColors.white,
              wheight: KWheights.medium,
              size: KSizes.smallest,
            ),
          ),
          AButton(
            kind: KKind.secondary,
            onTap: () async {
              await signInWithGoogle();
              ref.read(currentMenuProvider.state).state = KAvailableMenus.none;
            },
            child: ATypography.withIcon(
              AppLocalizations.of(context)!.mergeMenuDeclineAction,
              Icons.close,
              wheight: KWheights.medium,
              size: KSizes.smallest,
            ),
          )
        ],
      ),
    );
  }
}
