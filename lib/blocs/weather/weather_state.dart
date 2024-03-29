// weather_state.dart
part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {}
