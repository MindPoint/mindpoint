import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/constants/colors.dart';

import 'android_status_bar.dart';

class PageBase extends HookWidget {
  final Widget child;

  const PageBase({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
          AndroidStatusBar(),
          Expanded(
            flex: 1,
            child: child,
          ),
        ],
      ),
    );
  }
}
