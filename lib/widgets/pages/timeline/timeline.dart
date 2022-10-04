import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/menus.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:mindpoint/hooks/first_run.dart';
import 'package:mindpoint/widgets/molecule/footer.dart';
import 'package:mindpoint/widgets/molecule/menu.dart';
import 'package:mindpoint/widgets/pages/timeline/footer/default.dart';
import 'package:mindpoint/widgets/pages/timeline/footer/edit.dart';
import 'package:mindpoint/widgets/pages/timeline/menus/edit.dart';
import 'package:mindpoint/widgets/pages/timeline/menus/merge.dart';
import 'package:mindpoint/widgets/pages/timeline/menus/profile.dart';
import 'package:mindpoint/widgets/pages/timeline/menus/welcome.dart';

import '../../../data/models/node.dart';
import '../../template/default_template.dart';

import '../../organisms/node_list.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentMenu = ref.watch(currentMenuProvider);

    final nodesProvider = ref.watch(nodesClassProvider);

    final MediaQueryData data = MediaQuery.of(context);

    // When the user makes the first lounches the app, go to the welcome menu
    useAppFirstRunEffect(() {
      ref.read(currentMenuProvider.state).state = KAvailableMenus.welcome;
    });

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: DefaultTemplate(
          content: StreamBuilder(
            stream: nodesProvider.streaming,
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
              KAvailableMenus.merge: const MMenuState(
                child: TimelineMergeMenu(),
              ),
              KAvailableMenus.welcome: const MMenuState(
                child: TimelineWelcomeMenu(),
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
              KAvailableMenus.merge: const MFooterState(
                child: TimelineDefaultFooter(),
              ),
              KAvailableMenus.welcome: const MFooterState(
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
