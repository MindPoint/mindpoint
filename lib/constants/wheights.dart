import 'package:flutter/cupertino.dart';

enum Wheights {
  light,
  regular,
  medium,
  bold,
}

final fontWheights = {
  Wheights.light: FontWeight.w300,
  Wheights.regular: FontWeight.w400,
  Wheights.medium: FontWeight.w500,
  Wheights.bold: FontWeight.w700,
};
