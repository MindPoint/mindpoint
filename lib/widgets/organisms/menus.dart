import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/menus.dart';

class Menus extends StatelessWidget {
  const Menus({
    Key? key,
    required this.currentMenu,
  }) : super(key: key);

  final AvailableMenus currentMenu;

  @override
  Widget build(BuildContext context) {
    final menus = {
      AvailableMenus.none: Container(),
      AvailableMenus.profile: Container(
        key: const ValueKey(AvailableMenus.profile),
        padding: EdgeInsets.all(8),
        child: Flex(
          direction: Axis.vertical,
          children: const [
            Text('profile'),
            Text('profile'),
            Text('profile'),
            Text('profile'),
            Text('profile'),
            Text('profile'),
            Text('profile'),
            Text('profile'),
          ],
        ),
      ),
      AvailableMenus.attachments: Container(
        key: const ValueKey(AvailableMenus.attachments),
        padding: EdgeInsets.all(8),
        child: Flex(
          direction: Axis.vertical,
          children: const [
            Text('attachments'),
            Text('attachments'),
            Text('attachments'),
            Text('attachments'),
            Text('attachments'),
          ],
        ),
      ),
      AvailableMenus.edit: Container(
        key: const ValueKey(AvailableMenus.attachments),
        padding: EdgeInsets.all(8),
        child: Flex(
          direction: Axis.vertical,
          children: const [
            Text('editing'),
          ],
        ),
      ),
    };

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
          child: menus[currentMenu],
        ),
      ),
    );
  }
}
