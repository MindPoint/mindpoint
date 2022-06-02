import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/text/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

enum DSLabelSize {
  big,
  medium,
  small,
}

class DSLabel extends StatelessWidget {
  final String data;
  final Color color;
  final DSLabelSize size;

  const DSLabel({
    super.key,
    required this.data,
    this.color = DSColor.black,
    this.size = DSLabelSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final styles = {
      DSLabelSize.small: (BuildContext context) => getLabelSmallStyle(
            mediaQueryData: MediaQuery.of(context),
            color: color,
          ),
      DSLabelSize.medium: (BuildContext context) => getLabelMediumStyle(
            mediaQueryData: MediaQuery.of(context),
            color: color,
          ),
      DSLabelSize.big: (BuildContext context) => getLabelBiggerStyle(
            mediaQueryData: MediaQuery.of(context),
            color: color,
          ),
    };

    return Text(
      data,
      style: styles[size]!(context),
      textDirection: defaultTextDirection,
    );
  }
}
