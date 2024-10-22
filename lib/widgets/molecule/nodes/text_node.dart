import 'package:flutter/cupertino.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/constants/font_families.dart';

import '../../atoms/typography.dart';

class TextNode extends StatelessWidget {
  final FirestoreNode node;

  const TextNode({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return ATypography(
      overflow: TextOverflow.visible,
      node.data,
      style: KFontFamily.robotoSerif,
    );
  }
}
