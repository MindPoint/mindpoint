import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      duration: const Duration(milliseconds: 300),
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
