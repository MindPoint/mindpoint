import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/units.dart';

abstract class MMenuAbstract {
  final Widget? child;

  const MMenuAbstract({
    this.child,
  });
}

class MMenuState implements MMenuAbstract {
  @override
  final Widget? child;

  const MMenuState({
    this.child,
  });
}

class MMenu extends StatelessWidget implements MMenuAbstract {
  @override
  final Widget? child;

  const MMenu({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: -10.0,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  static Widget withState<K>({
    Key? key,
    required K state,
    required Map<K, MMenuState> states,
  }) {
    assert(states[state] != null);

    final current = states[state] as MMenuState;

    return MMenu(
      key: key,
      child: current.child,
    );
  }
}

class MMenuWrapper extends StatelessWidget {
  final Widget child;
  const MMenuWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: KColors.black10,
            strokeAlign: StrokeAlign.inside,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: KUnits.xxxxbig,
        horizontal: KUnits.xxbig,
      ),
      child: child,
    );
  }
}
