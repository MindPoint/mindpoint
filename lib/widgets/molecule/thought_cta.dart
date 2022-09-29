import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/kinds.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';
import '../../data/providers/main.dart';
import '../atoms/typography.dart';

class ThoughtCallToAction extends HookConsumerWidget {
  const ThoughtCallToAction({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userIsOnEditMenu = ref.watch(userIsOnEditMenuProvider);
    final currentThoughtData = ref.watch(currentThoughtDataProvider);

    return currentThoughtData.isEmpty || userIsOnEditMenu
        ? const CustomTypography(
            'No que está pensando?',
            kind: KKind.secondary,
          )
        : Flex(
            direction: Axis.horizontal,
            children: [
              const CustomTypography(
                'Rascunho:',
                kind: KKind.secondary,
                wheight: KWheights.medium,
              ),
              const SizedBox(width: KUnits.xxsmall),
              Expanded(
                child: CustomTypography(
                  currentThoughtData,
                  kind: KKind.secondary,
                  wheight: KWheights.regular,
                ),
              ),
            ],
          );
  }
}
