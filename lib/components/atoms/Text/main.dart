import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindpoint/styles/colors/main.dart';

/// This typedef was extracted from: package:google_fonts/google_fonts.dart
typedef TextStyleMethod = TextStyle Function({
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
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
});

enum DSTextKinds {
  primary,
  secondary,
}

enum DSTextSizes {
  xs,
  s,
  m,
  g,
  xg,
}

enum DSTextWheights {
  light,
  regular,
  medium,
  bold,
}

class DSTextKind {
  final Color color;
  final TextStyleMethod styleMethod;

  DSTextKind({
    required this.color,
    required this.styleMethod,
  });
}

class DSTextSize {
  final double fontSize;

  DSTextSize({
    required this.fontSize,
  });
}

class DSTextWheight {
  final FontWeight fontWheight;

  DSTextWheight({
    required this.fontWheight,
  });
}

final Map<DSTextKinds, DSTextKind> kinds = {
  DSTextKinds.primary: DSTextKind(
    color: DSColor.black100,
    styleMethod: GoogleFonts.poppins,
  ),
  DSTextKinds.secondary: DSTextKind(
    color: DSColor.black50,
    styleMethod: GoogleFonts.poppins,
  ),
};

final Map<DSTextSizes, DSTextSize> sizes = {
  DSTextSizes.xs: DSTextSize(fontSize: 12),
  DSTextSizes.s: DSTextSize(fontSize: 14),
  DSTextSizes.m: DSTextSize(fontSize: 16),
  DSTextSizes.g: DSTextSize(fontSize: 20),
  DSTextSizes.xg: DSTextSize(fontSize: 36),
};

final Map<DSTextWheights, DSTextWheight> wheights = {
  DSTextWheights.light: DSTextWheight(fontWheight: FontWeight.w300),
  DSTextWheights.regular: DSTextWheight(fontWheight: FontWeight.w400),
  DSTextWheights.medium: DSTextWheight(fontWheight: FontWeight.w500),
  DSTextWheights.bold: DSTextWheight(fontWheight: FontWeight.w700),
};

class DSTextStyle {
  final DSTextKinds kind;
  final DSTextSizes size;
  final DSTextWheights wheight;
  final Color? color;

  const DSTextStyle({
    this.kind = DSTextKinds.primary,
    this.size = DSTextSizes.m,
    this.wheight = DSTextWheights.regular,
    this.color,
  });

  DSTextKind get _selectedKind {
    return kinds[kind] as DSTextKind;
  }

  DSTextSize get _selectedSize {
    return sizes[size] as DSTextSize;
  }

  DSTextWheight get _selectedWheight {
    return wheights[wheight] as DSTextWheight;
  }

  TextStyle get style {
    final textStyle = _selectedKind.styleMethod(
      color: color ?? _selectedKind.color,
      fontSize: _selectedSize.fontSize,
      fontWeight: _selectedWheight.fontWheight,
    );

    return textStyle;
  }

  factory DSTextStyle.create({
    DSTextKinds kind = DSTextKinds.primary,
    DSTextSizes size = DSTextSizes.m,
    DSTextWheights wheight = DSTextWheights.regular,
    Color? color,
  }) {
    return DSTextStyle(
      kind: kind,
      size: size,
      wheight: wheight,
      color: color,
    );
  }
}

class DSText extends StatelessWidget {
  final String data;
  final DSTextKinds kind;
  final DSTextSizes size;
  final DSTextWheights wheight;
  final Color? color;

  const DSText(
    this.data, {
    super.key,
    this.kind = DSTextKinds.primary,
    this.size = DSTextSizes.m,
    this.wheight = DSTextWheights.regular,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final DSTextKind selectedKind = kinds[kind] as DSTextKind;
    final DSTextSize selectedSize = sizes[size] as DSTextSize;
    final DSTextWheight selectedWheight = wheights[wheight] as DSTextWheight;

    final textStyle = selectedKind.styleMethod(
      color: color ?? selectedKind.color,
      fontSize: selectedSize.fontSize,
      fontWeight: selectedWheight.fontWheight,
    );

    return Text(
      data,
      style: textStyle,
      textDirection: TextDirection.ltr,
      textScaleFactor: 1,
    );
  }
}
