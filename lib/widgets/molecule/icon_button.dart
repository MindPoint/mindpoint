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
    this.kind = KKind.primary,
    this.color = KColors.white,
    this.disabled = false,
  });

  final String label;
  final IconData icon;
  final KKind kind;
  final Color color;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Button(
      kind: kind,
      disabled: disabled,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(width: KUnits.xxsmall),
          ATypography(
            label,
            color: color,
            wheight: KWheights.medium,
            size: KSizes.smallest,
          )
        ],
      ),
    );
  }
}
