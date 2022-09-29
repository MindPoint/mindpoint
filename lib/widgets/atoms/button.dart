import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/constants/units.dart';

import 'package:vibration/vibration.dart';

const kButtonKind = KKind.primary;
const kButtonShouldAnimate = true;
const kButtonDisabled = false;

const Map<KKind, Color> kButtonBorderColors = {
  KKind.primary: KColors.black,
  KKind.secondary: KColors.black,
  KKind.tertiary: KColors.black10,
  KKind.quaternary: KColors.transparent,
};

const Map<KKind, Color> kButtonBackgroundColors = {
  KKind.primary: KColors.black,
  KKind.secondary: KColors.white,
  KKind.tertiary: KColors.gray10,
  KKind.quaternary: KColors.transparent,
};

abstract class AButtonAbstract {
  final KKind kind;
  final Widget? child;

  final bool animate;
  final bool disabled;

  final void Function()? onTap;

  AButtonAbstract({
    this.child,
    this.kind = kButtonKind,
    this.animate = kButtonShouldAnimate,
    this.disabled = kButtonDisabled,
    this.onTap,
  });
}

class AButtonState implements AButtonAbstract {
  @override
  final KKind kind;
  @override
  final Widget? child;
  @override
  final bool animate;
  @override
  final bool disabled;
  @override
  final void Function()? onTap;

  const AButtonState({
    this.child,
    this.kind = kButtonKind,
    this.animate = kButtonShouldAnimate,
    this.disabled = kButtonDisabled,
    this.onTap,
  });
}

class AButton extends HookWidget implements AButtonAbstract {
  @override
  final KKind kind;
  @override
  final Widget? child;
  @override
  final bool animate;
  @override
  final bool disabled;
  @override
  final void Function()? onTap;

  const AButton({
    super.key,
    this.child,
    this.kind = kButtonKind,
    this.animate = kButtonShouldAnimate,
    this.disabled = kButtonDisabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tapping = useState(false);

    final scaleX = tapping.value ? 0.98 : 1.0;
    final scaleY = scaleX;

    void userIsTapping() {
      try {
        if (disabled) return;
        if (!animate) return;

        tapping.value = true;
        Vibration.vibrate(duration: 25);
      } on Exception catch (e) {}
    }

    void userNotTapping() {
      if (disabled) return;
      if (!animate) return;

      try {
        tapping.value = false;
      } on Exception catch (e) {}
    }

    return GestureDetector(
      onTap: () => onTap == null ? null : onTap!(),
      onTapDown: (d) {
        userIsTapping();
      },
      onTapUp: (d) {
        userNotTapping();
      },
      onVerticalDragEnd: (d) {
        userNotTapping();
      },
      onHorizontalDragEnd: (d) {
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
          padding: const EdgeInsets.symmetric(horizontal: KUnits.xsmall),
          decoration: BoxDecoration(
            color: kButtonBackgroundColors[kind] as Color,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1,
              color: kButtonBorderColors[kind] as Color,
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

  static Widget withStates<K>({
    required Map<K, AButtonState> states,
    required K state,
    Key? key,
  }) {
    assert(states[state] != null);

    final current = states[state] as AButtonState;

    return AButton(
      key: key,
      animate: current.animate,
      disabled: current.disabled,
      kind: current.kind,
      onTap: current.onTap,
      child: current.child,
    );
  }
}
