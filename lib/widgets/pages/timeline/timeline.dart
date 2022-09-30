import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:mindpoint/widgets/molecule/footer.dart';
import 'package:mindpoint/widgets/molecule/menu.dart';
import 'package:mindpoint/widgets/pages/timeline/footer/default.dart';
import 'package:mindpoint/widgets/pages/timeline/footer/edit.dart';
import 'package:mindpoint/widgets/pages/timeline/menus/edit.dart';
import 'package:mindpoint/widgets/pages/timeline/menus/profile.dart';

import '../../../data/models/node.dart';
import '../../template/default_template.dart';

import '../../organisms/node_list.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final stream = ref.watch(nodesProvider.stream);
    final currentMenu = ref.watch(currentMenuProvider);

    final MediaQueryData data = MediaQuery.of(context);

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: DefaultTemplate(
          content: StreamBuilder(
            stream: stream,
            builder:
                (context, AsyncSnapshot<Iterable<FirestoreNode>> snapshot) {
              return NodeList(
                nodes: snapshot.data?.toList() ?? [],
              );
            },
          ),
          menu: MMenu.withState(
            state: currentMenu,
            states: {
              KAvailableMenus.none: const MMenuState(
                child: SizedBox(height: 0),
              ),
              KAvailableMenus.profile: const MMenuState(
                child: TimelineProfileMenu(),
              ),
              KAvailableMenus.edit: const MMenuState(
                child: TimelineEditMenu(),
              ),
            },
          ),
          footer: MFooter.withStates(
            state: currentMenu,
            states: {
              KAvailableMenus.none: const MFooterState(
                child: TimelineDefaultFooter(),
              ),
              KAvailableMenus.profile: const MFooterState(
                child: TimelineDefaultFooter(),
              ),
              KAvailableMenus.edit: const MFooterState(
                child: TimelineEditFooter(),
              ),
            },
          ),
        ),
      ),
    );
  }
}
