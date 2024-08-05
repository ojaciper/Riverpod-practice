import 'package:hooks_riverpod/hooks_riverpod.dart';

const names = [
  'Alice',
  'Skepta',
  'Udi',
  'Sowaribin',
  'Promise',
  'Ayo',
  'Progress',
  'David',
  'Justice',
  'Michael',
  'Cliton',
  'Godspower',
  'Larry',
  'Fred',
  'Ginny',
  'Joseph',
];
final tickerProvider = StreamProvider(
  (ref) => Stream.periodic(
    const Duration(seconds: 1),
    (i) => i + 1,
  ),
);

final nameProvider = StreamProvider((ref) {
  return ref
      .watch(tickerProvider.stream)
      .map((count) => names.getRange(0, count));
});
