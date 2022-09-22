import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';
import 'package:mindpoint/constants/units.dart';

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
  final List<Widget>? children;

  const Button({super.key, this.children, this.kind = Kind.primary});

  @override
  Widget build(BuildContext context) {
    final tapping = useState(false);
    final scaleX = tapping.value ? 0.90 : 1.0;
    final scaleY = scaleX;

    return GestureDetector(
      onTapDown: (details) {
        tapping.value = true;
      },
      onTapUp: (details) {
        tapping.value = false;
      },
      onVerticalDragEnd: (details) {
        tapping.value = false;
      },
      onHorizontalDragEnd: (details) {
        tapping.value = false;
      },
      onLongPressEnd: (details) {
        tapping.value = false;
      },
      onForcePressEnd: (details) {
        tapping.value = false;
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 25,
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
        padding: const EdgeInsets.symmetric(horizontal: Units.small),
        decoration: BoxDecoration(
          color: buttonBackgroundColors[kind] as Color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: buttonBorderColors[kind] as Color,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children ?? [],
        ),
      ),
    );
  }
}
