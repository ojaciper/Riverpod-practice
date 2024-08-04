import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  void increment() => state = state == null ? 1 : state! + 1;
}

final counterProvider =
    StateNotifierProvider<Counter, int?>((ref) => Counter());
