import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';

import 'package:mindpoint/styles/colors/main.dart';
import 'package:mindpoint/controllers/auth/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/PageScaffold/main.dart';

class DSTimelinePage extends HookConsumerWidget {
  const DSTimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authControllerProvider.notifier);
    final user = ref.watch(authControllerProvider);

    return PageScaffold(
      template: Column(children: [
        Container(
          color: DSColor.white,
          child: DSText(user?.displayName ?? 'Anonimous'),
        ),
        DSButton(
          'logout',
          onTap: () {
            auth.signOut();
          },
        ),
      ]),
    );
  }
}
