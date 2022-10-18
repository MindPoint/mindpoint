import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';

import 'android_status_bar.dart';

class PageBase extends HookConsumerWidget {
  final Widget child;

  const PageBase({
    super.key,
    required this.child,
  });

  @override
  Widget build(context, ref) {
    /**
     * Adds a padding on the bottom when the keyboard is open;
     */
    final keyboardPaddingBottom = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(
        bottom: keyboardPaddingBottom,
      ),
      decoration: const BoxDecoration(
        color: KColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AndroidStatusBar(),
          Expanded(
            flex: 1,
            child: child,
          ),
        ],
      ),
    );
  }
}
