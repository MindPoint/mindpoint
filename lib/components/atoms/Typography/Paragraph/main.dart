import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/text/main.dart';

enum ParagraphVariation {
  medium,
  small,
}

class Paragraph extends StatelessWidget {
  final String data;
  final ParagraphVariation variation;

  const Paragraph({super.key, required this.data, required this.variation});

  @override
  Widget build(BuildContext context) {
    switch (variation) {
      case ParagraphVariation.medium:
        return Text(
          data,
          style:
              getParagraphMediumStyle(mediaQueryData: MediaQuery.of(context)),
          textDirection: defaultTextDirection,
        );
      case ParagraphVariation.small:
        return Text(
          data,
          style: getParagraphSmallStyle(mediaQueryData: MediaQuery.of(context)),
          textDirection: defaultTextDirection,
        );
      default:
        return Text(
          data,
          style:
              getParagraphMediumStyle(mediaQueryData: MediaQuery.of(context)),
          textDirection: defaultTextDirection,
        );
    }
  }
}
