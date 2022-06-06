import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/colors/main.dart';

enum DSIconSizes {
  small,
  medium,
  big,
}

final Map<DSIconSizes, double> sizes = {
  DSIconSizes.small: 16.0,
  DSIconSizes.medium: 24.0,
  DSIconSizes.big: 28.0,
};

class DSIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final DSIconSizes size;

  const DSIcon(
    this.icon, {
    super.key,
    this.color = DSColor.black100,
    this.size = DSIconSizes.medium,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: sizes[size],
    );
  }
}
