import 'package:flutter/cupertino.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/constants/font_families.dart';

import '../../atoms/typography.dart';

class TextNode extends StatelessWidget {
  final Node node;

  const TextNode({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTypography(
      overflow: TextOverflow.visible,
      node.data,
      fontFamily: FontFamilies.robotoSerif,
    );
  }
}
