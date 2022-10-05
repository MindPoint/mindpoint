import 'package:flutter/cupertino.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/data/models/node.dart';
import 'package:mindpoint/widgets/molecule/nodes/text_node.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/wheights.dart';
import '../atoms/typography.dart';

class GroupedNodes {
  final DateTime timestamp;
  final List<FirestoreNode> nodes;

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

  String getDisplayLabel(BuildContext context, DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final nodeDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (nodeDate == today) {
      return AppLocalizations.of(context)!.pageTodayLabel;
    }
    if (nodeDate == yesterday) {
      return AppLocalizations.of(context)!.pageYesterdayLabel;
    }

    return '${nodeDate.day}/${nodeDate.month}/${nodeDate.year}';
  }

  Widget getCorrectNodeWidget(FirestoreNode node) {
    switch (node.type) {
      case FirestoreNodeTypes.text:
        return TextNode(node: node);
      default:
        return TextNode(node: node);
    }
  }

  List<Widget> getNodeWidgetsToBeRendered(
      BuildContext context, List<FirestoreNode> nodes) {
    if (nodes.isEmpty) {
      return [
        NodeGroupChildWrapper(
          child: ATypography(
            AppLocalizations.of(context)!.pageHintText,
            color: KColors.black60,
            overflow: TextOverflow.fade,
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
          ATypography(
            getDisplayLabel(context, group.timestamp),
            wheight: KWheights.medium,
          ),

          // Adds a padding to each node and selects the correct widget
          ...getNodeWidgetsToBeRendered(context, group.nodes),
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
