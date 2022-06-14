import 'package:flutter/widgets.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSAvatar extends StatelessWidget {
  final String _data;
  final void Function()? onTap;

  const DSAvatar(
    this._data, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: GestureDetector(
        onTap: onTap,
        child: FocusableActionDetector(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFA800),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(width: 1, color: DSColor.gray50),
            ),
            child: Center(
              child: DSText(
                _data[0].toUpperCase(),
                size: DSTextSizes.m,
                wheight: DSTextWheights.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSAvatar)
Widget defaultDSAvatarUseCase(BuildContext context) {
  WidgetsFlutterBinding.ensureInitialized();

  return DSAvatar(
    context.knobs.text(
      label: 'Label',
      initialValue: 'Foo Bar',
      description:
          'The value that will be used to retrieve the first character',
    ),
    onTap: () => print('avatar taped'),
  );
}
