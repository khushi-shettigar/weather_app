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

  //WeatherBloc({required this.weatherRepository}) : super(WeatherInitial());

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>(_mapFetchWeatherToState);
  }

  /*@override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    print("Hiiii...2");
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    }
  }*/

  /*Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    try {
      final weather = await WeatherRepository.getWeather(event.city);
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield WeatherError();
    }
  }*/

  void _mapFetchWeatherToState(FetchWeather event, Emitter<WeatherState> emit) async {
    try {
      final weather = await WeatherRepository.getWeather(event.city);
      emit(WeatherLoaded(weather: weather));
      } catch (_) {
        emit(WeatherError());
      }
    }

}