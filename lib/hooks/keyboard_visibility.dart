import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void useKeyBoardVisibility(void Function(bool) cb) {
  useEffect(() {
    final controller = KeyboardVisibilityController();

    final subscription = controller.onChange.listen(cb);

    return () => subscription.cancel();
  }, [cb]);
}
