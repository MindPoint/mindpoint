import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/data/providers/main.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'firebase_options.dart';
import 'package:mindpoint/router/main.dart';

// Intializes the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // Initializes the app with a riverpod scope
    const ProviderScope(
      child: App(),
    ),
  );
}

// Initializes the Widgetbook
@WidgetbookApp.material(
  name: 'Mind Point',
  frames: [
    WidgetbookFrame(
      name: 'Widgetbook',
      allowsDevices: true,
    ),
  ],
  devices: [],
  textScaleFactors: [1],
  foldersExpanded: true,
  widgetsExpanded: true,
  constructor: WidgetbookConstructor.custom,
)
class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Instantiate an instance of AuthControllerProvider to check if the user is
    // logged in, if it is, the useEffect hook will navigate the app to the
    // /timeline route
    final userViewModel = ref.watch(userViewModelProvider);

    // Initialize the router to be able to navigate throught the app
    final router = useMemoized<GoRouter>(() => createRouterInstance(), []);

    // If the user is logged in, go to the app page
    useEffect(() {
      if (userViewModel.isAuthenticated) {
        router.go(RouteNames.timeline);
      }

      return null;
    }, [userViewModel.isAuthenticated]);

    return WidgetsApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Mind Point',
      color: Colors.white,
    );
  }
}

// Define themes to be used on WidgetBook
@WidgetbookTheme(name: 'Light', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();
@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => ThemeData.dark();
