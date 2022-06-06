// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:mindpoint/main.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:mindpoint/components/molecules/PageScaffold/main.dart';
import 'package:go_router/go_router.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:mindpoint/components/atoms/Icon/main.dart';
import 'package:mindpoint/styles/colors/main.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(
        name: 'Mind Point',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: getLightTheme(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: getDarkTheme(),
        ),
      ],
      frames: [
        WidgetbookFrame(
          name: 'Widgetbook',
          allowsDevices: true,
        ),
        WidgetbookFrame(
          name: 'None',
          allowsDevices: false,
        ),
      ],
      textScaleFactors: [
        1.0,
        2.0,
        3.0,
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'components',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'molecules',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'Button',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSButton',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultButtonUseCase(context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
                  ],
                  isExpanded: true,
                ),
              ],
              isExpanded: true,
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
