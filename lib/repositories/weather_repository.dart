import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final String apiKey;

  WeatherRepository(this.apiKey);

  static Future<WeatherModel> getWeather(String cityName) async {
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=4d5ca04506cce5b70a2c14da00805e5b';

    final response = await http.get(Uri.parse(apiUrl));
    print("response...... ${response.body.toString()}");

    if (response.statusCode == 200) {

      final weatherData = json.decode(response.body) as Map<String, dynamic>;
      final weatherModel = WeatherModel.fromJson(weatherData); // Assuming this is the constructor
      return weatherModel;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}