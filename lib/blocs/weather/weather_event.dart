
// weather_event.dart
part of 'weather_bloc.dart';

abstract class WeatherEvent {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({required this.city});

  @override
  List<Object> get props => [city];
}