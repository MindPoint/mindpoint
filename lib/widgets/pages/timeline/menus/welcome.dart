import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        label: const ATypography(
          'Bem vindo ao Mind Point!',
          wheight: KWheights.medium,
        ),
        content: const [
          ATypography(
            'Aliquip velit deserunt cillum Lorem labore id aliquip culpa in eu cillum aute. Enim veniam voluptate fugiat culpa. Consequat est ipsum nostrud elit amet veniam excepteur consequat. Adipisicing ad velit adipisicing ipsum Lorem ex. Et commodo consectetur dolore quis minim enim tempor enim consectetur incididunt veniam veniam culpa. Labore id nostrud est amet amet eiusmod tempor dolore sit. Eu velit incididunt amet consequat non sit nulla eu.',
            wheight: KWheights.regular,
            overflow: TextOverflow.visible,
          ),
          ATypography(
            'Aliquip velit deserunt cillum Lorem labore id aliquip culpa in eu cillum aute. Enim veniam voluptate fugiat culpa. Consequat est ipsum nostrud elit amet veniam excepteur consequat. Adipisicing ad velit adipisicing ipsum Lorem ex. Et commodo consectetur dolore quis minim enim tempor enim consectetur incididunt veniam veniam culpa. Labore id nostrud est amet amet eiusmod tempor dolore sit. Eu velit incididunt amet consequat non sit nulla eu.',
            wheight: KWheights.regular,
            overflow: TextOverflow.visible,
          ),
          ATypography(
            'Aliquip velit deserunt cillum Lorem labore id aliquip culpa in eu cillum aute. Enim veniam voluptate fugiat culpa. Consequat est ipsum nostrud elit amet veniam excepteur consequat. Adipisicing ad velit adipisicing ipsum Lorem ex. Et commodo consectetur dolore quis minim enim tempor enim consectetur incididunt veniam veniam culpa. Labore id nostrud est amet amet eiusmod tempor dolore sit. Eu velit incididunt amet consequat non sit nulla eu.',
            wheight: KWheights.regular,
            overflow: TextOverflow.visible,
          ),
        ],
        actions: [
          AButton(
            onTap: () async {
              ref.read(currentMenuProvider.state).state = KAvailableMenus.none;
            },
            child: ATypography.withIcon(
              'Entendi',
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
