import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/menus.dart';
import 'package:mindpoint/providers/main.dart';
import 'package:mindpoint/widgets/template/default_template.dart';

import '../organisms/footer.dart';
import '../organisms/menus.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final nodes = [];

    final currentMenu = ref.watch(currentMenuProvider);

    final userIsEditing =
        useMemoized(() => currentMenu == AvailableMenus.edit, [currentMenu]);

    final userIsOnProfileMenu =
        useMemoized(() => currentMenu == AvailableMenus.profile, [currentMenu]);

    final userIsOnAttachmentsMenu = useMemoized(
        () => currentMenu == AvailableMenus.attachments, [currentMenu]);

    return Scaffold(
      body: DefaultTemplate(
        content: ListView.separated(
          padding: const EdgeInsets.all(0),
          itemCount: nodes.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(nodes[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
        menu: const Menus(),
        footer: Footer(
          username: 'João',
          currentThoughtData: '',
          isProfileMenuOpen: userIsOnProfileMenu,
          isAttachmentsMenuOpen: userIsOnAttachmentsMenu,
          onCtaTapDown: () {
            ref.read(currentMenuProvider.state).state = AvailableMenus.edit;
          },
          onProfileButtonTapDown: () {
            ref.read(currentMenuProvider.state).state = userIsOnProfileMenu
                ? AvailableMenus.none
                : AvailableMenus.profile;
          },
          onAttachmentsButtonTapDown: () {
            ref.read(currentMenuProvider.state).state = userIsOnAttachmentsMenu
                ? AvailableMenus.none
                : AvailableMenus.attachments;
          },
        ),
      ),
    );
  }
}
