import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/font_families.dart';
import 'package:mindpoint/constants/wheights.dart';

import '../../constants/kinds.dart';
import '../../constants/sizes.dart';

typedef TypeTextStyleCallBack = TextStyle Function({
  Paint? background,
  Color? backgroundColor,
  Color? color,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  List<ui.FontFeature>? fontFeatures,
  double? fontSize,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  Paint? foreground,
  double? height,
  double? letterSpacing,
  Locale? locale,
  List<ui.Shadow>? shadows,
  TextBaseline? textBaseline,
  TextStyle? textStyle,
  double? wordSpacing,
});

const kTypographyKind = KKind.primary;
const kTypographySize = KSizes.small;
const kTypographyWheight = KWheights.regular;
const kTypographyStyle = KFontFamily.poppins;
const kTypographyOverflow = TextOverflow.ellipsis;
const kTypographySelectable = false;

const kTypographyFontColor = {
  KKind.primary: KColors.black,
  KKind.secondary: KColors.black50,
};

const kTypographyIconColor = {
  KKind.primary: KColors.black,
  KKind.secondary: KColors.black50,
};

const kTypographyFontSize = {
  KSizes.smallest: KUnits.big,
  KSizes.small: KUnits.xbig,
};

const kTypographyWithIconSize = {
  KSizes.smallest: KUnits.xxbig,
  KSizes.small: KUnits.xxxbig,
};

class ATypography extends StatelessWidget {
  final String data;

  final KKind kind;
  final KSizes size;
  final FontWeight wheight;

  final TypeTextStyleCallBack style;

  final Color? color;

  final TextOverflow overflow;

  final bool selectable;

  const ATypography(
    this.data, {
    super.key,
    this.kind = kTypographyKind,
    this.size = kTypographySize,
    this.wheight = kTypographyWheight,
    this.style = kTypographyStyle,
    this.color,
    this.overflow = kTypographyOverflow,
    this.selectable = kTypographySelectable,
  });

  @override
  Widget build(BuildContext context) {
    final selectedStyle = style(
      color: color ?? kTypographyFontColor[kind],
      fontSize: kTypographyFontSize[size],
      fontWeight: wheight,
    );

    if (selectable) {
      return SelectableText(
        data,
        style: selectedStyle,
      );
    } else {
      return Text(
        data,
        style: selectedStyle,
        overflow: overflow,
      );
    }
  }

  static Widget withIcon(
    String data,
    IconData icon, {
    Key? key,
    KKind kind = kTypographyKind,
    KSizes size = kTypographySize,
    FontWeight wheight = kTypographyWheight,
    TypeTextStyleCallBack style = KFontFamily.poppins,
    Color? color,
    TextOverflow overflow = kTypographyOverflow,
  }) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Icon(
            icon,
            size: kTypographyWithIconSize[size],
            color: color ?? kTypographyIconColor[kind],
          ),
        ),
        const SizedBox(width: KUnits.xxsmall),
        Flexible(
          flex: 1,
          child: ATypography(
            data,
            key: key,
            kind: kind,
            size: size,
            wheight: wheight,
            color: color,
            style: style,
            overflow: overflow,
          ),
        ),
      ],
    );
  }
}
