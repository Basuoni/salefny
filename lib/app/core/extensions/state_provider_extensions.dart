import 'package:flutter_riverpod/flutter_riverpod.dart';

extension StateProviderExtensions<T> on StateProvider<T> {
  void emit(ProviderRef ref, T newState) {
    ref.read(notifier).state = newState;
  }

  T value(ProviderRef ref) {
    return ref.watch(notifier).state;
  }
}
