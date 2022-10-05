import 'dart:ui';
import 'package:flutter/widgets.dart';

bool useCurrentlyInDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}
