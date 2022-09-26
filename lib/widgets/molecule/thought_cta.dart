import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/kinds.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';
import '../../providers/main.dart';
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
            kind: Kind.secondary,
          )
        : Flex(
            direction: Axis.horizontal,
            children: [
              const CustomTypography(
                'Rascunho:',
                kind: Kind.secondary,
                wheight: Wheights.medium,
              ),
              const SizedBox(width: Units.xxsmall),
              Flexible(
                flex: 1,
                child: CustomTypography(
                  currentThoughtData,
                  kind: Kind.secondary,
                  wheight: Wheights.regular,
                ),
              )
            ],
          );
  }
}
