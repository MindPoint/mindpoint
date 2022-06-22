import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:mindpoint/styles/colors/main.dart';
import 'package:mindpoint/components/atoms/AndroidStatusBar/main.dart';

class PageScaffold extends HookWidget {
  final Widget template;

  const PageScaffold({
    super.key,
    required this.template,
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
        color: DSColor.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AndroidStatusBar(),
          Expanded(
            flex: 1,
            child: template,
          ),
        ],
      ),
    );
  }
}
