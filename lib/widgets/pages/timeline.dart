import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/constants/colors.dart';
import 'package:mindpoint/constants/kinds.dart';

import 'package:mindpoint/providers/main.dart';
import 'package:mindpoint/widgets/atoms/button.dart';
import 'package:mindpoint/widgets/template/default_template.dart';

import 'dart:developer' as developer;

import '../../constants/units.dart';

final TextStyle defaultPoppins = GoogleFonts.poppins(fontSize: Units.xbig);
final TextStyle defaultRobotoSerif =
    GoogleFonts.robotoSerif(fontSize: Units.xbig);

class Footer extends HookConsumerWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapping = useState(false);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Units.xxbig,
        vertical: Units.big,
      ),
      child: Row(
        children: [
          Text(
            'No que está pensando',
            style: defaultPoppins,
            textScaleFactor: 1,
          ),

          // Attachments
          const Button(
            kind: Kind.tertiary,
            child: Icon(
              Icons.attachment,
              size: 16,
              color: CustomColors.black,
            ),
          ),

          // Avatar
          Button(
            child: Text(
              'J',
              style: GoogleFonts.poppins(
                color: CustomColors.white,
                fontSize: Units.xxbig,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
          ),
        ],
      ),
    );
  }
}

Text createDefaultTextWidget(String data, {required TextStyle style}) {
  return Text(
    data,
    style: style,
    textScaleFactor: 1,
  );
}

Widget createPage() {
  return Container(
    padding: const EdgeInsets.all(12),
    child: const Text('asdasd'),
  );
}

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    developer.log('log start', name: 'com.mindpoint.log');

    final userViewModel = ref.watch(userViewModelProvider);

    print(userViewModel.user);

    useEffect(() {
      userViewModel.signIn();
    }, []);

    final nodes = [];

    return Scaffold(
      body: DefaultTemplate(
        content: ListView.separated(
          padding: const EdgeInsets.all(0),
          itemCount: nodes.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(nodes[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
        notification: Text('asdasd'),
        footer: const Footer(),
      ),
    );
  }
}
