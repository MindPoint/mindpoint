import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/constants/units.dart';
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
        label: const ATypography(
          'Atenção!',
          wheight: KWheights.medium,
        ),
        content: const [
          ATypography(
            'Você realizará o login em uma nova conta. Deseja adicionar os pensamentos deste usuário anonimo a sua conta atual?',
            wheight: KWheights.regular,
            overflow: TextOverflow.visible,
          ),
          ATypography(
            'Caso você decida por não adicionar, os dados serão perdidos e não poderão mais ser recuperados!',
            wheight: KWheights.regular,
            overflow: TextOverflow.visible,
          ),
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
              'Adicionar',
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
              'Não adicionar',
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
