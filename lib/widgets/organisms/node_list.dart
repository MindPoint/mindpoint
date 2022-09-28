import 'dart:async';
import 'dart:developer';

import 'package:collection/collection.dart';
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

    final reversed = useState(false);
    final controller = useScrollController();

    // This allow the list to stick to the top of the page when the list doesn't
    // have enougth data to be displayed sticking to the bottom of the screen.
    useEffect(() {
      final timer = Timer.periodic(const Duration(milliseconds: 1), (t) {
        if (!controller.hasClients) return;

        if (controller.position.maxScrollExtent > 0 && !reversed.value) {
          reversed.value = true;
        } else if (controller.position.maxScrollExtent == 0 && reversed.value) {
          reversed.value = false;
        }
      });

      return () => timer.cancel();
    }, []);

    // Is required to reverse the data to display it in the correct order, the
    // [ListView] will be reversed too, so the Nodes can "stick" to the bottom.
    final groupedNodes = useMemoized(() {
      return groupBy<Node, String>(
        nodes,
        (node) => DateTime(
          node.timestamp.year,
          node.timestamp.month,
          node.timestamp.day,
        ).toIso8601String(),
      ).values.sortedBy((element) => element[0].timestamp).toList();
    }, [nodes]);

    final normalizedGroupNodes =
        reversed.value ? groupedNodes.reversed.toList() : groupedNodes;

    return ListView.separated(
      // shrinkWrap: true,
      controller: controller,
      padding: const EdgeInsets.all(0),
      itemCount: normalizedGroupNodes.length,
      itemBuilder: (BuildContext context, int index) => AnimatedOpacity(
        key: ValueKey(
            normalizedGroupNodes[index][0].timestamp.toIso8601String()),
        opacity: isOnAnyMenu ? 0.7 : 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        child: NodeGroup(nodes: normalizedGroupNodes[index]),
      ),
      reverse: reversed.value,
      separatorBuilder: (BuildContext context, int index) =>
          const NodeListSeparator(),
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
