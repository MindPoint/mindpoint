import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/font_families.dart';
import 'package:mindpoint/constants/wheights.dart';

import '../../constants/kinds.dart';
import '../../constants/sizes.dart';

final typographyFontColor = {
  KKind.primary: KColors.black,
  KKind.secondary: KColors.black50,
};

final typographyFontSize = {
  KSizes.smallest: KUnits.big,
  KSizes.small: KUnits.xbig,
};

class CustomTypography extends StatelessWidget {
  final String data;

  final KKind kind;
  final KSizes size;
  final FontWeight wheight;

  final TextStyle Function({
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) fontFamily;

  final Color? color;

  final TextOverflow overflow;

  final bool selectable;

  const CustomTypography(
    this.data, {
    super.key,
    this.kind = KKind.primary,
    this.size = KSizes.small,
    this.wheight = KWheights.regular,
    this.fontFamily = KFontFamily.poppins,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = fontFamily(
      color: color ?? typographyFontColor[kind],
      fontSize: typographyFontSize[size],
      fontWeight: wheight,
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
