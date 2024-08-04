import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/future_provider/future_provider.dart';

class StateView extends ConsumerWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Future Provider")),
      body: Column(
        children: [
          currentWeather.when(
              data: (data) => Text(
                    data,
                    style: TextStyle(fontSize: 40),
                  ),
              error: (_, __) => const Text("error"),
              loading: () => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )),
          Expanded(
              child: ListView.builder(
            itemCount: City.values.length,
            itemBuilder: (context, index) {
              final city = City.values[index];
              final isSelected = city == ref.watch(currentCityProvider);
              return ListTile(
                  title: Text(city.toString()),
                  trailing: isSelected ? const Icon(Icons.check) : null,
                  onTap: () =>
                      ref.read(currentCityProvider.notifier).state = city);
            },
          ))
        ],
      ),
    );
  }
}
