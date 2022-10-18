import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/menus.dart';

final currentMenuProvider =
    StateProvider<KAvailableMenus>((ref) => KAvailableMenus.none);

final userIsOnAnyKindOfMenu = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) != KAvailableMenus.none);

final userIsOnEditMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == KAvailableMenus.edit);

final userIsOnProfileMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == KAvailableMenus.profile);

final userIsOnAttachmentsMenuProvider = Provider<bool>(
    (ref) => ref.watch(currentMenuProvider) == KAvailableMenus.attachments);
