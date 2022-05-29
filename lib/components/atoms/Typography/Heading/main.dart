import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/text/main.dart';

class Heading extends StatelessWidget {
  final String data;

  const Heading({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: getHeadingBigStyle(mediaQueryData: MediaQuery.of(context)),
      textDirection: defaultTextDirection,
    );
  }
}
