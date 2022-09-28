import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/widgets/molecule/nodes/text_node.dart';

import '../../constants/wheights.dart';
import '../atoms/typography.dart';

class NodeGroup extends StatelessWidget {
  final List<Node> nodes;

  const NodeGroup({
    super.key,
    required this.nodes,
  });

  String getDisplayLabel(Node currentNode) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final nodeDate = DateTime(currentNode.timestamp.year,
        currentNode.timestamp.month, currentNode.timestamp.day);

    if (nodeDate == today) return 'Hoje';
    if (nodeDate == yesterday) return 'Ontem';

    return '${nodeDate.day}/${nodeDate.month}/${nodeDate.year}';
  }

  Widget getCorrectNodeWidget(Node node) {
    switch (node.type) {
      case NodeTypes.text:
        return TextNode(node: node);
      default:
        return TextNode(node: node);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Units.big),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group label
          CustomTypography(
            getDisplayLabel(nodes[0]),
            wheight: Wheights.medium,
          ),

          // Adds a padding to each node and selects the correct widget
          ...nodes.map((node) {
            log('$node');
            return NodeGroupChildWrapper(
              child: getCorrectNodeWidget(node),
            );
          }).toList()
        ],
      ),
    );
  }
}

class NodeGroupChildWrapper extends StatelessWidget {
  final Widget child;

  const NodeGroupChildWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Units.small),
      child: child,
    );
  }
}
