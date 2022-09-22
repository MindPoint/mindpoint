import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/widgets/atoms/page_base.dart';

class DefaultTemplate extends HookWidget {
  final Widget content;
  final Widget notification;
  final Widget footer;

  const DefaultTemplate({
    super.key,
    required this.content,
    required this.notification,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return PageBase(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: content,
          ),
          notification,
          footer
        ],
      ),
    );
  }
}
