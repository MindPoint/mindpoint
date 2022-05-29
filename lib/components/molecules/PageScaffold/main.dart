import 'package:flutter/widgets.dart';

import 'package:mindpoint/styles/colors/main.dart';
import 'package:mindpoint/components/atoms/AndroidStatusBar/main.dart';

class PageScaffold extends StatelessWidget {
  List<Widget> children = [];

  PageScaffold({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AndroidStatusBar(),
          ...children,
        ],
      ),
    );
  }
}
