import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mindpoint/styles/colors/main.dart';

class AndroidStatusBar extends StatelessWidget {
  AndroidStatusBar({super.key}) {
    /**
     * Initialize the color of the device status bar
     */
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      color: white100,
    );
  }
}