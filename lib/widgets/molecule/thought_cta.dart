import 'package:flutter/widgets.dart';

import '../../constants/kinds.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';
import '../atoms/typography.dart';

class ThoughtCallToAction extends StatelessWidget {
  const ThoughtCallToAction({
    super.key,
    required this.currentThoughtData,
  });

  final String currentThoughtData;

  @override
  Widget build(BuildContext context) {
    return currentThoughtData.isEmpty
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