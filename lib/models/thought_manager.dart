import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Manages the state of the thought the user is currently typing, supports a
/// a ChangeStack to track what the user are currently typing.
class CurrentThoughtManager extends StateNotifier<String> {
  CurrentThoughtManager(super.state);

  /// Changes the value of the current thought and uses the Stack to track changes
  void change(String data) {
    state = data;
  }
}
