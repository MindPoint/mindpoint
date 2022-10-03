import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/constants/units.dart';

import '../../../../constants/menus.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/wheights.dart';
import '../../../../data/models/node.dart';
import '../../../../data/providers/main.dart';
import '../../../atoms/button.dart';
import '../../../atoms/custom_icons.dart';
import '../../../atoms/typography.dart';

class TimelineMergeMenu extends HookConsumerWidget {
  const TimelineMergeMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodesProvider = ref.watch(nodesClassProvider);

    return Container(
        width: double.infinity,
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
          vertical: KUnits.xxxxbig,
          horizontal: KUnits.xxbig,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ATypography(
              'Atenção!',
              wheight: KWheights.medium,
            ),
            const SizedBox(
              height: KUnits.xxbig,
            ),
            const ATypography(
              'Você realizará o login em uma nova conta. Deseja adicionar os pensamentos deste usuário anonimo a sua conta atual?',
              wheight: KWheights.regular,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: KUnits.small,
            ),
            const ATypography(
              'Caso você decida por não adicionar, os dados serão perdidos e não poderão mais ser recuperados!',
              wheight: KWheights.regular,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: KUnits.xxxxbig,
            ),
            Row(children: [
              Container(
                padding: const EdgeInsets.only(right: KUnits.small),
                child: AButton(
                  onTap: () async {
                    final nodesToMerge = [...nodesProvider.nodes];

                    await signInWithGoogle();

                    for (var node in nodesToMerge) {
                      await addNode(FirebaseAuth.instance.currentUser, node);
                    }

                    ref.read(currentMenuProvider.state).state =
                        KAvailableMenus.none;
                  },
                  child: ATypography.withIcon(
                    'Adicionar',
                    Icons.done,
                    color: KColors.white,
                    wheight: KWheights.medium,
                    size: KSizes.smallest,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: KUnits.small),
                child: AButton(
                  kind: KKind.secondary,
                  onTap: () async {
                    await signInWithGoogle();
                    ref.read(currentMenuProvider.state).state =
                        KAvailableMenus.none;
                  },
                  child: ATypography.withIcon(
                    'Não adicionar',
                    Icons.close,
                    wheight: KWheights.medium,
                    size: KSizes.smallest,
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
