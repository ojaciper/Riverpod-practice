import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/state_notifier_provider/state_notifier_provider.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer(builder: (context, ref, child) {
          final count = ref.watch(counterProvider);
          final text = count == null ? "Press a button" : count.toString();
          return Text(text);
        }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: const Text("Increment counter"),
          )
        ],
      ),
    );
  }
}
