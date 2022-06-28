// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:mindpoint/main.dart';
import 'package:mindpoint/router/main.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:mindpoint/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:core';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';
import 'package:mindpoint/components/atoms/Icon/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:mindpoint/styles/colors/main.dart';
import 'package:mindpoint/components/pages/Welcome/main.dart';
import 'package:flutter/widgets.dart';
import 'package:mindpoint/components/molecules/PageScaffold/main.dart';
import 'package:mindpoint/components/templates/Welcome/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindpoint/components/atoms/Step/main.dart';
import 'package:mindpoint/components/pages/Authentication/main.dart';
import 'package:mindpoint/components/templates/Authentication/main.dart';
import 'package:mindpoint/components/atoms/CustomIcons/main.dart';
import 'package:mindpoint/components/atoms/Avatar/main.dart';
import 'package:mindpoint/components/molecules/AppBar/main.dart';
import 'package:mindpoint/components/templates/Timeline/main.dart';
import 'package:mindpoint/components/atoms/EditableText/main.dart';
import 'package:mindpoint/hooks/debounce.dart';
import 'package:mindpoint/components/molecules/Thought/main.dart';
import 'package:mindpoint/data/models/thought_model.dart';

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
      ],
      textScaleFactors: [
        1.0,
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
                      name: 'AppBar',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSAppBar',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSAppBarUseCase(context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
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
                    WidgetbookFolder(
                      name: 'Thought',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSEditableTextThought',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSEditableThoughtUseCase(context),
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
                WidgetbookFolder(
                  name: 'atoms',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'EditableText',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSEditableText',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Keeps focus on new line',
                              builder: (context) =>
                                  defaultDSEditableTextUseCase(context),
                            ),
                            WidgetbookUseCase(
                              name: 'Lose focus on new line',
                              builder: (context) =>
                                  loseFocusWhenNewLineDSEditableTextUseCase(
                                      context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
                    WidgetbookFolder(
                      name: 'Avatar',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSAvatar',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSAvatarUseCase(context),
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
                WidgetbookFolder(
                  name: 'templates',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'Authentication',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSAuthenticationTemplate',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSAuthorizationTemplateUseCase(
                                      context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
                    WidgetbookFolder(
                      name: 'Timeline',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSTimelineTemplate',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSTimelineTemplateUseCase(context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
                    WidgetbookFolder(
                      name: 'Welcome',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSWelcomeTemplate',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSWelcomeTemplateUseCase(context),
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
                WidgetbookFolder(
                  name: 'pages',
                  widgets: [],
                  folders: [
                    WidgetbookFolder(
                      name: 'Authentication',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSAuthenticationPage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSAuthenticationPageUseCase(context),
                            ),
                          ],
                          isExpanded: true,
                        ),
                      ],
                      folders: [],
                      isExpanded: true,
                    ),
                    WidgetbookFolder(
                      name: 'Welcome',
                      widgets: [
                        WidgetbookComponent(
                          name: 'DSWelcomePage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'Default',
                              builder: (context) =>
                                  defaultDSWelcomePageUseCase(context),
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
