import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mindpoint/styles/colors/main.dart';

const TextDirection defaultTextDirection = TextDirection.ltr;

/// Compensate for textScaleFactor for devices, this function helps mantaining the
/// best user experience possible, independent of the user font scaling
double Function({
  MediaQueryData? mediaQueryData,
}) compensateDeviceScalingFactor = ({
  mediaQueryData,
}) =>
    mediaQueryData != null ? (1.0 - mediaQueryData.textScaleFactor) + 1.0 : 1.0;

/// Utility function that helps generating the style of a text
TextStyle Function({
  MediaQueryData? mediaQueryData,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) createTextStyle({
  Color defaultColor = black100,
  double defaultFontSize = 16,
  FontWeight defaultFontWeight = FontWeight.w500,
}) {
  TextStyle fn({
    MediaQueryData? mediaQueryData,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.poppins(
      color: color ?? defaultColor,
      fontSize: (fontSize ?? defaultFontSize) *
          compensateDeviceScalingFactor(
            mediaQueryData: mediaQueryData,
          ), // This size is affected by the deviceScaleFactor
      fontWeight: fontWeight ?? defaultFontWeight,
    );
  }

  return fn;
}

final getHeadingBigStyle = createTextStyle(
  defaultColor: black100,
  defaultFontSize: 36,
  defaultFontWeight: FontWeight.w700,
);

final getParagraphSmallStyle = createTextStyle(
  defaultColor: black100,
  defaultFontSize: 14,
  defaultFontWeight: FontWeight.w400,
);

final getParagraphMediumStyle = createTextStyle(
  defaultColor: black100,
  defaultFontSize: 16,
  defaultFontWeight: FontWeight.w400,
);

final getLabelSmallStyle = createTextStyle(
  defaultColor: black100,
  defaultFontSize: 12,
  defaultFontWeight: FontWeight.w500,
);

final getLabelMediumStyle = createTextStyle(
  defaultColor: black100,
  defaultFontSize: 14,
  defaultFontWeight: FontWeight.w500,
);

final getLabelBiggerStyle = createTextStyle(
  defaultColor: black100,
  defaultFontSize: 16,
  defaultFontWeight: FontWeight.w500,
);
