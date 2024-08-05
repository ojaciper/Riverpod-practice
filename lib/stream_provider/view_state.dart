import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/stream_provider/stream_provider.dart';

class ViewState extends ConsumerWidget {
  const ViewState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ticker = ref.read(tickerProvider).asData;
    // print(ticker);
    final name = ref.watch(nameProvider);
    print(name);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stream Provider"),
          centerTitle: true,
        ),
        body: name.when(
          data: (name) {
            return ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(name.elementAt(index).toString()),
                  );
                });
          },
          error: (error, __) => const Text("Reached the end of the list"),
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
