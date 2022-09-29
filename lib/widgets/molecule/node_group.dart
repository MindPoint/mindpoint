import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/widgets/molecule/nodes/text_node.dart';

import '../../constants/wheights.dart';
import '../atoms/typography.dart';

class GroupedNodes {
  final DateTime timestamp;
  final List<Node> nodes;

  GroupedNodes({
    required this.timestamp,
    required this.nodes,
  });
}

class NodeGroup extends StatelessWidget {
  final GroupedNodes group;

  const NodeGroup({
    super.key,
    required this.group,
  });

  String getDisplayLabel(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final nodeDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

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

  List<Widget> getNodeWidgetsToBeRendered(List<Node> nodes) {
    if (nodes.isEmpty) {
      return [
        const NodeGroupChildWrapper(
          child: CustomTypography(
            'Você ainda não escreveu nada hoje.',
            color: KColors.black60,
          ),
        ),
      ];
    } else {
      return nodes.map((node) {
        return NodeGroupChildWrapper(
          child: getCorrectNodeWidget(node),
        );
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KUnits.big),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group label
          CustomTypography(
            getDisplayLabel(group.timestamp),
            wheight: KWheights.medium,
          ),

          // Adds a padding to each node and selects the correct widget
          ...getNodeWidgetsToBeRendered(group.nodes),
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
      margin: const EdgeInsets.only(top: KUnits.small),
      child: child,
    );
  }
}
