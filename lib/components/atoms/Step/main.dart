import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/colors/main.dart';

enum DSStepBulletState {
  active,
  inactive,
}

class DSStepBullet extends StatelessWidget {
  final DSStepBulletState state;

  const DSStepBullet({
    super.key,
    this.state = DSStepBulletState.inactive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: black100,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
        color: state == DSStepBulletState.active ? black100 : transparent,
      ),
    );
  }
}
