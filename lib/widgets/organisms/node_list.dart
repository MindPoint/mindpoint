import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/providers/main.dart';
import 'package:mindpoint/widgets/molecule/node_group.dart';

import '../../constants/colors.dart';
import '../../constants/font_families.dart';
import '../../constants/units.dart';
import '../../constants/wheights.dart';
import '../../data/models/node.dart';
import '../atoms/typography.dart';

class NodeList extends HookConsumerWidget {
  final List<Node> nodes;

  const NodeList({
    super.key,
    required this.nodes,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isOnAnyMenu = ref.watch(userIsOnAnyKindOfMenu);

    // Is required to reverse the data to display it in the correct order, the
    // [ListView] will be reversed too, so the Nodes can "stick" to the bottom.
    final normalizedGroupNodes = useMemoized(() {
      return groupBy<Node, String>(
        nodes,
        (node) => DateTime(
          node.timestamp.year,
          node.timestamp.month,
          node.timestamp.day,
        ).toIso8601String(),
      )
          .values
          .sortedBy((element) => element[0].timestamp)
          .toList()
          .reversed
          .toList();
    }, [nodes]);

    return CustomScrollView(
      semanticChildCount: normalizedGroupNodes.length,
      reverse: true,
      slivers: <Widget>[
        SliverLayoutBuilder(
          builder: (context, constraints) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimatedOpacity(
                    opacity: isOnAnyMenu ? 0.75 : 1,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    child: index == 0
                        // Should increase the size of the first NodeGroup
                        ? Container(
                            constraints: BoxConstraints(
                              minHeight: normalizedGroupNodes.length > 1
                                  ? constraints.viewportMainAxisExtent - 100
                                  : constraints.viewportMainAxisExtent,
                            ),
                            child:
                                NodeGroup(nodes: normalizedGroupNodes[index]),
                          )
                        // Should add an border to the bottom of the other NodeGroups
                        : Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: CustomColors.gray50,
                                ),
                              ),
                            ),
                            child:
                                NodeGroup(nodes: normalizedGroupNodes[index]),
                          ),
                  );
                },
                semanticIndexCallback: (Widget widget, int localIndex) {
                  if (localIndex.isEven) {
                    return localIndex ~/ 2;
                  }
                  return null;
                },
                childCount: normalizedGroupNodes.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

class NodeListSeparator extends StatelessWidget {
  const NodeListSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: CustomColors.gray50,
    );
  }
}
