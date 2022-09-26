import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/constants/units.dart';

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

  final bool animate;
  final bool disabled;

  const Button({
    super.key,
    this.child,
    this.kind = Kind.primary,
    this.animate = true,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final tapping = useState(false);

    final scaleX = tapping.value ? 0.98 : 1.0;
    final scaleY = scaleX;

    void userIsTapping() {
      if (!animate) return;

      tapping.value = true;
      Vibration.vibrate(duration: 25);
    }

    void userNotTapping() {
      if (!animate) return;

      tapping.value = false;
    }

    return Listener(
      onPointerDown: (details) {
        if (disabled) return;

        userIsTapping();
      },
      onPointerUp: (details) {
        if (disabled) return;

        userNotTapping();
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 50),
        opacity: disabled ? 0.5 : 1,
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
      ),
    );
  }
}
