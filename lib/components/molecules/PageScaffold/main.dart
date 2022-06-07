import 'package:flutter/widgets.dart';

import 'package:mindpoint/styles/colors/main.dart';
import 'package:mindpoint/components/atoms/AndroidStatusBar/main.dart';

class PageScaffold extends StatelessWidget {
  final Widget template;

  const PageScaffold({
    super.key,
    required this.template,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white100),
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
