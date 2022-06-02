import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/components/atoms/Typography/Label/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

enum DSButtonVariations {
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
class DSButtonVariation {
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

  DSButtonVariation({
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  });
}

/// Defines a Button size
class DSButtonSize {
  final double padding;
  final double borderSize;
  final DSLabelSize labelSize;

  DSButtonSize({
    required this.padding,
    required this.labelSize,
    required this.borderSize,
  });
}

class DSButtonShape {
  final double borderRadius;

  DSButtonShape({
    required this.borderRadius,
  });
}

const String _defaultDataValue = 'Lorem Ipsum';

_defaultOnTapFn() {}

class DSButton extends HookWidget {
  final String data;
  final DSButtonSizes size;
  final DSButtonShapes shape;
  final DSButtonVariations variation;

  final void Function() onTap;

  final Map<DSButtonVariations, DSButtonVariation> variations = {
    DSButtonVariations.primary: DSButtonVariation(
      textColor: DSColor.white,
      borderColor: DSColor.black100,
      backgroundColor: DSColor.black100,
    ),
    DSButtonVariations.secondary: DSButtonVariation(
      textColor: DSColor.black100,
      borderColor: DSColor.black100,
      backgroundColor: DSColor.white,
    ),
    DSButtonVariations.tertiary: DSButtonVariation(
      textColor: DSColor.black100,
      borderColor: DSColor.gray50,
      backgroundColor: DSColor.gray10,
    ),
    DSButtonVariations.quaternary: DSButtonVariation(
      textColor: DSColor.black100,
      borderColor: DSColor.transparent,
      backgroundColor: DSColor.transparent,
    ),
    DSButtonVariations.disabled: DSButtonVariation(
      textColor: DSColor.black30,
      borderColor: DSColor.black10,
      backgroundColor: DSColor.gray50,
    ),
  };

  final Map<DSButtonSizes, DSButtonSize> sizes = {
    DSButtonSizes.small: DSButtonSize(
      padding: 8.0,
      labelSize: DSLabelSize.small,
      borderSize: 1.0,
    ),
    DSButtonSizes.medium: DSButtonSize(
      padding: 12,
      labelSize: DSLabelSize.medium,
      borderSize: 2.0,
    ),
    DSButtonSizes.big: DSButtonSize(
      padding: 22,
      labelSize: DSLabelSize.medium,
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

  DSButton({
    super.key,
    this.data = _defaultDataValue,
    this.size = DSButtonSizes.medium,
    this.shape = DSButtonShapes.squared,
    this.variation = DSButtonVariations.primary,
    this.onTap = _defaultOnTapFn,
  });

  @override
  Widget build(BuildContext context) {
    final DSButtonSize selectedSize = sizes[size] as DSButtonSize;
    final DSButtonShape selectedShape = shapes[shape] as DSButtonShape;
    final DSButtonVariation selectedVariation =
        variations[variation] as DSButtonVariation;

    return GestureDetector(
      onTap: onTap,
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
          children: [
            DSLabel(
              data: data,
              size: selectedSize.labelSize,
              color: selectedVariation.textColor,
            )
          ],
        ),
      ),
    );
  }
}
