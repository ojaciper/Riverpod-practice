import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/simple_provider/provider.dart';

class SimpleProvider extends ConsumerWidget {
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Center(
        child: Text(date.toIso8601String()),
      ),
    );
  }
}
