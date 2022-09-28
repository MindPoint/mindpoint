import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/font_families.dart';
import 'package:mindpoint/constants/wheights.dart';

import '../../constants/kinds.dart';
import '../../constants/sizes.dart';

final typographyFontColor = {
  Kind.primary: CustomColors.black,
  Kind.secondary: CustomColors.black50,
};

final typographyFontSize = {
  Sizes.smallest: Units.big,
  Sizes.small: Units.xbig,
};

class CustomTypography extends StatelessWidget {
  final String data;

  final Kind kind;
  final Sizes size;
  final Wheights wheight;

  final FontFamilies fontFamily;
  final Color? color;

  final TextOverflow overflow;

  final bool selectable;

  const CustomTypography(
    this.data, {
    super.key,
    this.kind = Kind.primary,
    this.size = Sizes.small,
    this.wheight = Wheights.regular,
    this.fontFamily = FontFamilies.poppins,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = fontFamilies[fontFamily]!(
      color: color ?? typographyFontColor[kind],
      fontSize: typographyFontSize[size],
      fontWeight: fontWheights[wheight],
    );

    if (selectable) {
      return SelectableText(
        data,
        style: style,
      );
    } else {
      return Text(
        data,
        style: style,
        overflow: overflow,
      );
    }
  }
}
