import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/kinds.dart';
import '../atoms/button.dart';

enum DoubleStateButtonState {
  primary,
  secondary,
}

class DoubleStateButton extends StatelessWidget {
  final Kind primaryKind;
  final Kind secondaryKind;

  final Widget primaryChild;
  final Widget secondaryChild;

  final DoubleStateButtonState state;

  const DoubleStateButton({
    super.key,
    this.primaryKind = Kind.primary,
    this.secondaryKind = Kind.secondary,
    required this.primaryChild,
    required this.secondaryChild,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final kindMap = {
      DoubleStateButtonState.primary: primaryKind,
      DoubleStateButtonState.secondary: secondaryKind
    };

    final childMap = {
      DoubleStateButtonState.primary: primaryChild,
      DoubleStateButtonState.secondary: secondaryChild
    };

    return Button(
      kind: kindMap[state]!,
      child: childMap[state]!,
    );
  }
}
