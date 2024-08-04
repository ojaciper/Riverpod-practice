import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City {
  stockholm,
  paris,
  tokyo,
  nigeria,
}

const unknowWeatherEmoji = "🤷‍♂️";

typedef WeatherEmoji = String;

Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () =>
        {
          City.stockholm: "❄️",
          City.paris: "🌧️",
          City.tokyo: "🌤️",
        }[city] ??
        "🔥",
  );
}

final currentCityProvider = StateProvider<City?>((ref) => null);

final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unknowWeatherEmoji;
  }
});
