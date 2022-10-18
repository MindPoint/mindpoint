class UState {
  UState._();

  static V? build<K, V>({
    required K state,
    required Map<K, V> states,
  }) {
    final current = states[state];

    return current;
  }
}
