import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/text/main.dart';

enum LabelVariation {
  medium,
  small,
}

class Label extends StatelessWidget {
  final String data;
  final LabelVariation variation;

  const Label({super.key, required this.data, required this.variation});

  @override
  Widget build(BuildContext context) {
    switch (variation) {
      case LabelVariation.medium:
        return Text(
          data,
          style: getLabelMediumStyle(mediaQueryData: MediaQuery.of(context)),
          textDirection: defaultTextDirection,
        );
      case LabelVariation.small:
        return Text(
          data,
          style: getLabelSmallStyle(mediaQueryData: MediaQuery.of(context)),
          textDirection: defaultTextDirection,
        );
      default:
        return Text(
          data,
          style: getLabelMediumStyle(mediaQueryData: MediaQuery.of(context)),
          textDirection: defaultTextDirection,
        );
    }
  }
}
