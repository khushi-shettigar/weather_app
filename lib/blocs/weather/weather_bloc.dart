import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

//Events
part 'weather_event.dart';

//states
part 'weather_state.dart';


//Bloc
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;


  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>(_mapFetchWeatherToState);
  }

  void _mapFetchWeatherToState(FetchWeather event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading()); // Emit the loading state before making the API call
      final weather = await WeatherRepository.getWeather(event.city);
      emit(WeatherLoaded(weather: weather));
      } catch (_) {
        emit(WeatherError());
      }
    }

}