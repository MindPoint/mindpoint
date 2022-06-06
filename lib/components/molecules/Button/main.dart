import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/Icon/main.dart';
import 'package:mindpoint/styles/colors/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

enum DSButtonKinds {
  primary,
  secondary,
  tertiary,
  quaternary,
  disabled,
}

enum DSButtonSizes {
  small,
  medium,
  big,
}

enum DSButtonShapes {
  squared,
  round,
}

/// Defines a Button variation
class DSButtonKind {
  final Color iconColor;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

  DSButtonKind({
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  });
}

/// Defines a Button size
class DSButtonSize {
  final double height;
  final double padding;
  final double borderSize;
  final DSIconSizes iconSize;
  final DSTextSizes textSize;

  DSButtonSize({
    required this.height,
    required this.padding,
    required this.iconSize,
    required this.textSize,
    required this.borderSize,
  });
}

class DSButtonShape {
  final double borderRadius;

  DSButtonShape({
    required this.borderRadius,
  });
}

_defaultOnTapFn() {}

final Map<DSButtonKinds, DSButtonKind> variations = {
  DSButtonKinds.primary: DSButtonKind(
    iconColor: DSColor.white,
    textColor: DSColor.white,
    borderColor: DSColor.black100,
    backgroundColor: DSColor.black100,
  ),
  DSButtonKinds.secondary: DSButtonKind(
    iconColor: DSColor.black100,
    textColor: DSColor.black100,
    borderColor: DSColor.black100,
    backgroundColor: DSColor.white,
  ),
  DSButtonKinds.tertiary: DSButtonKind(
    iconColor: DSColor.black100,
    textColor: DSColor.black100,
    borderColor: DSColor.gray50,
    backgroundColor: DSColor.gray10,
  ),
  DSButtonKinds.quaternary: DSButtonKind(
    iconColor: DSColor.black100,
    textColor: DSColor.black100,
    borderColor: DSColor.transparent,
    backgroundColor: DSColor.transparent,
  ),
  DSButtonKinds.disabled: DSButtonKind(
    iconColor: DSColor.black30,
    textColor: DSColor.black30,
    borderColor: DSColor.black10,
    backgroundColor: DSColor.gray50,
  ),
};

final Map<DSButtonSizes, DSButtonSize> sizes = {
  DSButtonSizes.small: DSButtonSize(
    height: 34,
    padding: 8.0,
    textSize: DSTextSizes.s,
    iconSize: DSIconSizes.small,
    borderSize: 1.0,
  ),
  DSButtonSizes.medium: DSButtonSize(
    height: 48,
    padding: 12,
    textSize: DSTextSizes.m,
    iconSize: DSIconSizes.medium,
    borderSize: 2.0,
  ),
  DSButtonSizes.big: DSButtonSize(
    height: 68,
    padding: 22,
    textSize: DSTextSizes.m,
    iconSize: DSIconSizes.big,
    borderSize: 2.0,
  ),
};

final Map<DSButtonShapes, DSButtonShape> shapes = {
  DSButtonShapes.squared: DSButtonShape(
    borderRadius: 4,
  ),
  DSButtonShapes.round: DSButtonShape(
    borderRadius: 100,
  ),
};

class DSButton extends HookWidget {
  final IconData? icon;
  final String? data;
  final DSButtonSizes size;
  final DSButtonShapes shape;
  final DSButtonKinds kind;
  final bool displayIcon;
  final bool displayLabel;

  final void Function() onTap;

  const DSButton(
    this.data, {
    super.key,
    this.icon,
    this.displayIcon = true,
    this.displayLabel = true,
    this.size = DSButtonSizes.medium,
    this.shape = DSButtonShapes.squared,
    this.kind = DSButtonKinds.primary,
    this.onTap = _defaultOnTapFn,
  });

  @override
  Widget build(BuildContext context) {
    final DSButtonSize selectedSize = sizes[size] as DSButtonSize;
    final DSButtonShape selectedShape = shapes[shape] as DSButtonShape;
    final DSButtonKind selectedVariation = variations[kind] as DSButtonKind;

    final List<Widget> children = [];

    final shouldAddIcon = displayIcon && icon != null;
    final shouldAddLabel = displayLabel && data != null;

    if (shouldAddIcon) {
      final iconWidget = DSIcon(
        icon as IconData,
        size: selectedSize.iconSize,
        color: selectedVariation.iconColor,
      );

      children.add(iconWidget);
    }

    // Adds some space between the two nodes
    if (shouldAddIcon && shouldAddLabel) {
      children.add(const SizedBox(width: 12));
    }

    if (shouldAddLabel) {
      final labelWidget = DSText(
        data as String,
        size: selectedSize.textSize,
        color: selectedVariation.textColor,
        wheight: DSTextWheights.medium,
      );

      children.add(labelWidget);
    }

    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            color: selectedVariation.backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                selectedShape.borderRadius,
              ),
            ),
            border: Border.all(
              color: selectedVariation.borderColor,
              width: selectedSize.borderSize,
            ),
          ),
          padding: EdgeInsets.all(selectedSize.padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

/// Usecases
@notations.WidgetbookUseCase(name: 'Default', type: DSButton)
Widget defaultButtonUseCase(BuildContext context) {
  return DSButton(
    context.knobs.nullableText(
      label: 'Label',
      initialValue: 'Lorem Ipsum',
      description: 'The value that will be displayed as the button label',
    ),
    kind: context.knobs.options(
      label: 'Kinds',
      description:
          'Determines the color properties of a given button, like background color or border color',
      options: [
        const Option(
          label: 'primary',
          value: DSButtonKinds.primary,
        ),
        const Option(
          label: 'secondary',
          value: DSButtonKinds.secondary,
        ),
        const Option(
          label: 'tertiary',
          value: DSButtonKinds.tertiary,
        ),
        const Option(
          label: 'quaternary',
          value: DSButtonKinds.quaternary,
        ),
        const Option(
          label: 'disabled',
          value: DSButtonKinds.disabled,
        ),
      ],
    ),
    size: context.knobs.options(
      label: 'Sizes',
      description:
          'Determines the size properties of the button, like padding, text size and icon size.',
      options: [
        const Option(
          label: 'big',
          value: DSButtonSizes.big,
        ),
        const Option(
          label: 'medium',
          value: DSButtonSizes.medium,
        ),
        const Option(
          label: 'small',
          value: DSButtonSizes.small,
        ),
      ],
    ),
    shape: context.knobs.options(
      label: 'Shape',
      description: 'Determines the shape of a button.',
      options: [
        const Option(
          label: 'squared',
          value: DSButtonShapes.squared,
        ),
        const Option(
          label: 'round',
          value: DSButtonShapes.round,
        ),
      ],
    ),
    icon: context.knobs.options(
      label: 'Icons',
      description: 'Input some icons to be used to test the button.',
      options: [
        const Option(
          label: 'arrow back',
          value: Icons.arrow_back,
        ),
        const Option(
          label: 'arrow forward',
          value: Icons.arrow_forward,
        ),
        const Option(
          label: 'undo',
          value: Icons.undo_rounded,
        ),
        const Option(
          label: 'redo',
          value: Icons.redo_rounded,
        ),
      ],
    ),
    displayIcon: context.knobs.boolean(
      label: 'Display Icon',
      initialValue: true,
    ),
    displayLabel: context.knobs.boolean(
      label: 'Display Label',
      initialValue: true,
    ),
  );
}
