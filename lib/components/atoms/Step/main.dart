import 'package:flutter/widgets.dart';
import 'package:mindpoint/styles/colors/main.dart';

enum StepBulletState {
  active,
  inactive,
}

class StepBullet extends StatelessWidget {
  final StepBulletState state;

  const StepBullet({
    super.key,
    this.state = StepBulletState.inactive,
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
        color: state == StepBulletState.active ? black100 : transparent,
      ),
    );
  }
}
