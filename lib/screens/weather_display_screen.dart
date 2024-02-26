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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('City: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(weather.city, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Temperature: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${weather.temperature}°C", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Condition: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(weather.condition, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Min Temperature: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${weather.minTemperature}°C", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Max Temperature: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${weather.maxTemperature}°C", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Humidity: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${weather.humidity}%", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Wind Speed: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${weather.windSpeed} m/s", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
