import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/constants/units.dart';

import 'dart:developer' as developer;

import 'package:vibration/vibration.dart';

const Map<Kind, Color> buttonBorderColors = {
  Kind.primary: CustomColors.black,
  Kind.secondary: CustomColors.black,
  Kind.tertiary: CustomColors.black10,
  Kind.quaternary: CustomColors.transparent,
};

const Map<Kind, Color> buttonBackgroundColors = {
  Kind.primary: CustomColors.black,
  Kind.secondary: CustomColors.white,
  Kind.tertiary: CustomColors.gray10,
  Kind.quaternary: CustomColors.transparent,
};

class Button extends HookWidget {
  final Kind kind;
  final Widget? child;

  const Button({super.key, this.child, this.kind = Kind.primary});

  @override
  Widget build(BuildContext context) {
    final tapping = useState(false);

    final scaleX = tapping.value ? 0.90 : 1.0;
    final scaleY = scaleX;

    final userIsTapping = useCallback(() {
      tapping.value = true;
    }, [tapping]);

    final userNotTapping = useCallback(() {
      tapping.value = false;
    }, [tapping]);

    final vibrateOnTap = useCallback(() {
      Vibration.vibrate(duration: 25);
    }, []);

    return GestureDetector(
      onTapDown: (details) {
        vibrateOnTap();
        userIsTapping();
      },
      onTapUp: (details) {
        userNotTapping();
      },
      onVerticalDragEnd: (details) {
        userNotTapping();
      },
      onHorizontalDragEnd: (details) {
        userNotTapping();
      },
      onLongPressEnd: (details) {
        userNotTapping();
      },
      onForcePressEnd: (details) {
        userNotTapping();
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 50,
        ),
        alignment: Alignment.center,
        transformAlignment: Alignment.center,
        transform:
            Matrix4(scaleX, 0, 0, 0, 0, scaleY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
        constraints: const BoxConstraints(
          minHeight: 32,
          maxHeight: 32,
          minWidth: 32,
        ),
        padding: const EdgeInsets.symmetric(horizontal: Units.xsmall),
        decoration: BoxDecoration(
          color: buttonBackgroundColors[kind] as Color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: buttonBorderColors[kind] as Color,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: child,
        ),
      ),
    );
  }
}
