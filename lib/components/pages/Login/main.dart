import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';
import 'package:mindpoint/components/molecules/PageScaffold/main.dart';
import 'package:mindpoint/data/providers/main.dart';
// import 'package:mindpoint/controllers/auth/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

class DSAuthPage extends HookConsumerWidget {
  const DSAuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref.watch(userViewModelProvider);

    return PageScaffold(
      template: Column(children: [
        Container(
          color: DSColor.white,
          child: const DSText('Tela de login'),
        ),
        DSButton(
          'LOGIN KRL',
          onTap: () {
            userViewModel.signIn();
          },
        ),
      ]),
    );
  }
}
