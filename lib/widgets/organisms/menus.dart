import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mindpoint/providers/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/widgets/organisms/profile_menu.dart';

import '../../constants/colors.dart';
import '../../constants/menus.dart';

class Menus extends HookConsumerWidget {
  const Menus({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final currentMenu = ref.watch(currentMenuProvider);

    final menu = useMemoized<Widget>(() {
      switch (currentMenu) {
        case AvailableMenus.profile:
          return const ProfileMenu();
        default:
          return Container();
      }
    }, [currentMenu]);

    return AnimatedSize(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 100),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: currentMenu == AvailableMenus.none
                  ? CustomColors.white
                  : CustomColors.black10,
              width: 1,
            ),
          ),
        ),
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 100),
          child: menu,
        ),
      ),
    );
  }
}
