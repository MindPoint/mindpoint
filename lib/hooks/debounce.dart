import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void Function(void Function() callback) useDebounce({
  Duration delay = const Duration(milliseconds: 250),
}) {
  final ValueNotifier<Timer?> timer = useState(null);

  return (callback) {
    if (timer.value?.isActive ?? false) timer.value?.cancel();

    timer.value = Timer(delay, callback);
  };
}
