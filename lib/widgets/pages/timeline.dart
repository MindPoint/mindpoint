import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mindpoint/widgets/template/default_template.dart';

import '../organisms/footer.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
        notification: Text(''),
        footer: const Footer(
          username: 'João',
          currentThoughtData:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla.',
          isProfileMenuOpen: false,
          isAttachmentsMenuOpen: false,
        ),
      ),
    );
  }
}
