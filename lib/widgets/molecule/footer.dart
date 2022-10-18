import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/units.dart';

abstract class MFooterAbstract {
  final Widget child;

  const MFooterAbstract({
    required this.child,
  });
}

class MFooterState implements MFooterAbstract {
  @override
  final Widget child;

  const MFooterState({
    required this.child,
  });
}

class MFooter extends HookConsumerWidget implements MFooterAbstract {
  @override
  final Widget child;

  const MFooter({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
        horizontal: KUnits.xxbig,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: KColors.black10,
          ),
          bottom: BorderSide(
            width: 1,
            color: KColors.black10,
          ),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: child,
      ),
    );
  }

  static Widget withStates<K>({
    Key? key,
    required K state,
    required Map<K, MFooterState> states,
  }) {
    assert(states[state] != null);

    final current = states[state] as MFooterState;

    return MFooter(
      key: key,
      child: current.child,
    );
  }
}
