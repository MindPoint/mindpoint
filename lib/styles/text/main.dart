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
TextStyle Function({MediaQueryData? mediaQueryData}) createTextStyle({
  double fontSize = 16,
  Color color = black100,
  FontWeight fontWeight = FontWeight.w500,
}) {
  TextStyle fn({
    MediaQueryData? mediaQueryData,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontSize *
          compensateDeviceScalingFactor(
            mediaQueryData: mediaQueryData,
          ), // This size is affected by the deviceScaleFactor
      fontWeight: fontWeight,
    );
  }

  return fn;
}

final getHeadingBigStyle = createTextStyle(
  color: black100,
  fontSize: 36,
  fontWeight: FontWeight.w700,
);

final getParagraphSmallStyle = createTextStyle(
  color: black100,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

final getParagraphMediumStyle = createTextStyle(
  color: black100,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final getLabelSmallStyle = createTextStyle(
  color: black100,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

final getLabelMediumStyle = createTextStyle(
  color: black100,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
