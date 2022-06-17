import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindpoint/components/atoms/Avatar/main.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

typedef Childrens = List<Widget>;

class DSAppBar extends StatelessWidget {
  final DSAvatar _avatar;
  final Childrens _children;

  const DSAppBar({
    super.key,
    required DSAvatar avatar,
    required Childrens children,
  })  : _avatar = avatar,
        _children = children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: DSColor.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: _children,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          _avatar,
        ],
      ),
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSAppBar)
Widget defaultDSAppBarUseCase(BuildContext context) {
  WidgetsFlutterBinding.ensureInitialized();

  return const DSAppBar(
    avatar: DSAvatar('João Vítor'),
    children: [
      DSButton(
        'HOJE',
        icon: Icons.calendar_today_rounded,
        size: DSButtonSizes.small,
        shape: DSButtonShapes.round,
        kind: DSButtonKinds.tertiary,
      )
    ],
  );
}
