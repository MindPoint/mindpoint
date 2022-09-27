import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/font_families.dart';
import 'package:mindpoint/constants/units.dart';
import 'package:mindpoint/providers/nodes.dart';
import 'package:mindpoint/widgets/atoms/typography.dart';
import 'package:mindpoint/widgets/template/default_template.dart';

import '../../data/models/node.dart';
import '../organisms/footer.dart';
import '../organisms/menus.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = useScrollController();

    final stream = ref.watch(nodesProvider.stream);

    return Scaffold(
      body: DefaultTemplate(
        content: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<Iterable<Node>> snapshot) {
            final nodes = snapshot.data?.toList().reversed.toList() ?? [];

            // log('${controller.position.maxScrollExtent}');
            // log('${controller.position.pixels}');
            // log('${controller.position.viewportDimension}');

            return ListView.separated(
              // shrinkWrap: true,
              controller: controller,
              padding: const EdgeInsets.all(0),
              itemCount: nodes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    bottom: Units.small,
                    left: Units.big,
                    right: Units.big,
                  ),
                  child: CustomTypography(
                    overflow: TextOverflow.visible,
                    nodes[index].data,
                    fontFamily: FontFamilies.robotoSerif,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox();
              },
              reverse: true,
            );
          },
        ),
        menu: const Menus(),
        footer: const Footer(),
      ),
    );
  }
}
