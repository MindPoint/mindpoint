import 'package:flutter/material.dart';
import 'package:mindpoint/constants/units.dart';

class MSection extends StatelessWidget {
  final Widget? label;
  final List<Widget> content;
  final List<Widget> actions;

  const MSection({
    super.key,
    this.label,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(
        maxHeight: viewportHeight - 56 - 300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MSectionLabelChildWrapper(
            child: label,
          ),
          MSectionContentWrapper(
            children: content,
          ),
          MSectionActionsScrollViewWrapper(
            children: actions,
          )
        ],
      ),
    );
  }
}

class MSectionLabelChildWrapper extends StatelessWidget {
  final Widget? child;

  const MSectionLabelChildWrapper({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: child != null ? KUnits.xxbig : 0,
      ),
      child: child,
    );
  }
}

class MSectionContentWrapper extends StatelessWidget {
  final List<Widget> children;

  const MSectionContentWrapper({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: KUnits.big,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
                .map((child) => MSectionContentChildWrapper(child: child))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class MSectionContentChildWrapper extends StatelessWidget {
  final Widget child;

  const MSectionContentChildWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: KUnits.small,
      ),
      child: child,
    );
  }
}

class MSectionActionsScrollViewWrapper extends StatelessWidget {
  final List<Widget> children;

  const MSectionActionsScrollViewWrapper({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: children
            .map((child) => MSectionActionWrapper(child: child))
            .toList(),
      ),
    );
  }
}

class MSectionActionWrapper extends StatelessWidget {
  final Widget child;

  const MSectionActionWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: KUnits.small,
      ),
      child: child,
    );
  }
}
