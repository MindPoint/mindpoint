import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mindpoint/constants/units.dart';

import 'package:mindpoint/providers/nodes.dart';
import 'package:mindpoint/widgets/atoms/typography.dart';
import 'package:mindpoint/widgets/template/default_template.dart';

import '../../data/models/node.dart';
import '../organisms/footer.dart';
import '../organisms/menus.dart';
import '../organisms/node_list.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = useScrollController();

    final stream = ref.watch(nodesProvider.stream);

    final MediaQueryData data = MediaQuery.of(context);

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: DefaultTemplate(
          content: StreamBuilder(
            stream: stream,
            builder: (context, AsyncSnapshot<Iterable<Node>> snapshot) {
              return NodeList(
                nodes: snapshot.data?.toList() ?? [],
              );
            },
          ),
          menu: const Menus(),
          footer: const Footer(),
        ),
      ),
    );
  }
}
