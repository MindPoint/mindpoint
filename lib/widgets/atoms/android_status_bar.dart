import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/hooks/dark_mode.dart';

class AndroidStatusBar extends HookConsumerWidget {
  const AndroidStatusBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentlyIndarkMode = useCurrentlyInDarkMode(context);

    useEffect(() {
      currentlyIndarkMode
          ? SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: KColors.black,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: transparent,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            )
          : SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: KColors.gray20,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: transparent,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            );
    }, [currentlyIndarkMode]);

    return Container(
      height: 25,
      color: KColors.transparent,
    );
  }
}
