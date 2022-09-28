import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mindpoint/constants/font_families.dart';
import 'package:mindpoint/constants/sizes.dart';
import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/constants/wheights.dart';
import 'package:mindpoint/data/models/node.dart';

import '../../atoms/typography.dart';

class TextNode extends StatelessWidget {
  final Node node;

  const TextNode({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Units.small),
      child: CustomTypography(
        overflow: TextOverflow.visible,
        node.data,
        fontFamily: FontFamilies.robotoSerif,
      ),
    );
  }
}
