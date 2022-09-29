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
import '../../data/models/node.dart';

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
    final groups = useMemoized(() {
      final groups = groupBy<Node, DateTime>(
        nodes,
        (node) => DateTime(
          node.timestamp.year,
          node.timestamp.month,
          node.timestamp.day,
        ),
      );

      // Adds a node group to the current day
      groups.putIfAbsent(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ),
        () => [],
      );

      // Maps the keys and objects to a [GroupedNodes] object, reverses it and
      // returns it to be rendered.
      return groups.keys
          .map((key) => GroupedNodes(timestamp: key, nodes: groups[key] ?? []))
          .toList()
          .reversed
          .toList();
    }, [nodes]);

    return CustomScrollView(
      semanticChildCount: groups.length,
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
                              minHeight: groups.length > 1
                                  ? constraints.viewportMainAxisExtent - 100
                                  : constraints.viewportMainAxisExtent,
                            ),
                            child: NodeGroup(group: groups[index]),
                          )
                        // Should add an border to the bottom of the other NodeGroups
                        : Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: KColors.gray50,
                                ),
                              ),
                            ),
                            child: NodeGroup(group: groups[index]),
                          ),
                  );
                },
                semanticIndexCallback: (Widget widget, int localIndex) {
                  if (localIndex.isEven) {
                    return localIndex ~/ 2;
                  }
                  return null;
                },
                childCount: groups.length,
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
      color: KColors.gray50,
    );
  }
}
