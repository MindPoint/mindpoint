import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';

enum KThemeMode {
  light,
  dark,
}

class ButtonTheme {}

class StatusBarTheme {
  final Color statusBarColor;
  final Brightness statusBarIconBrightness;
  final Color systemNavigationBarColor;
  final Brightness systemNavigationBarIconBrightness;

  StatusBarTheme({
    required this.statusBarColor,
    required this.statusBarIconBrightness,
    required this.systemNavigationBarColor,
    required this.systemNavigationBarIconBrightness,
  });
}

class TemplateTheme {
  final Color backgroundColor;

  TemplateTheme({
    required this.backgroundColor,
  });
}

class Theme {
  final ButtonTheme button;
  final TemplateTheme template;
  final StatusBarTheme statusBar;

  Theme({
    required this.button,
    required this.template,
    required this.statusBar,
  });
}

class BrightnessNotifier extends ChangeNotifier {
  Brightness brightness = SchedulerBinding.instance.window.platformBrightness;

  BrightnessNotifier() {
    SchedulerBinding.instance.window.onPlatformBrightnessChanged = () {
      log('data ${SchedulerBinding.instance.window.platformBrightness}');
      brightness = SchedulerBinding.instance.window.platformBrightness;
      notifyListeners();
    };
  }
}

final brightnessProvider =
    ChangeNotifierProvider((ref) => BrightnessNotifier());

final themeProvider = Provider((ref) {
  final brightness = ref.watch(brightnessProvider).brightness;

  final light = Theme(
    button: ButtonTheme(),
    template: TemplateTheme(
      backgroundColor: KColors.white,
    ),
    statusBar: StatusBarTheme(
      statusBarColor: KColors.gray20,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  final dark = Theme(
    button: ButtonTheme(),
    template: TemplateTheme(
      backgroundColor: KColors.black,
    ),
    statusBar: StatusBarTheme(
      statusBarColor: KColors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  switch (brightness) {
    case Brightness.light:
      return light;
    case Brightness.dark:
      return dark;
    default:
      return light;
  }
});
