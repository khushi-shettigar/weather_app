import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDisplayScreen extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDisplayScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('City: ${weather.city}'),
          Text('Temperature: ${weather.temperature}°C'),
          Text('Condition: ${weather.condition}'),
          Text('Min Temperature: ${weather.minTemperature}°C'),
          Text('Max Temperature: ${weather.maxTemperature}°C'),
          Text('Humidity: ${weather.humidity}%'),
          Text('Wind Speed: ${weather.windSpeed} m/s'),
        ],
      ),
    );
  }
}
