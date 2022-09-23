import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/kinds.dart';
import '../../constants/sizes.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';
import '../atoms/button.dart';

import '../atoms/typography.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.label,
    required this.icon,
    this.kind = Kind.primary,
    this.color = CustomColors.white,
  });

  final String label;
  final IconData icon;
  final Kind kind;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Button(
      kind: kind,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(width: Units.xxsmall),
          CustomTypography(
            label,
            color: color,
            wheight: Wheights.medium,
            size: Sizes.smallest,
          )
        ],
      ),
    );
  }
}
