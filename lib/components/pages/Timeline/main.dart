import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mindpoint/components/atoms/Avatar/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mindpoint/components/templates/Timeline/main.dart';
import 'package:mindpoint/components/molecules/PageScaffold/main.dart';

class DSTimelinePage extends HookConsumerWidget {
  const DSTimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref.watch(userViewModelProvider);
    // final timelineViewModel = ref.watch(timelineViewModelProvider);

    return PageScaffold(
      template: Stack(
        children: [
          DSTimelineTemplate(
            avatar: DSAvatar(userViewModel.user?.displayName ?? 'Anon'),
            children: const [
              DSText('foo'),
              DSText('bar'),
            ],
          ),
        ],
      ),
    );
  }
}