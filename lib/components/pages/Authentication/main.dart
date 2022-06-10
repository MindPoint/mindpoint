import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/firebase_options.dart';

// ignore: unused_import
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

import 'package:mindpoint/data/providers/main.dart';
import 'package:mindpoint/components/molecules/PageScaffold/main.dart';
import 'package:mindpoint/components/templates/Authentication/main.dart';

class DSAuthenticationPage extends HookConsumerWidget {
  const DSAuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref.watch(userViewModelProvider);

    final handleOnLoginTap = useCallback(() {
      userViewModel.signIn();
    }, [userViewModel]);

    return PageScaffold(
      template: DSAuthenticationTemplate(
        onLoginTap: handleOnLoginTap,
      ),
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSAuthenticationPage)
Widget defaultDSAuthenticationPageUseCase(BuildContext context) {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return const ProviderScope(
    child: DSAuthenticationPage(),
  );
}
