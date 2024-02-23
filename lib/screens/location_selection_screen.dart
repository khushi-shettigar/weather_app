import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/screens/weather_display_screen.dart';

class LocationSelectionScreen  extends StatelessWidget {
  LocationSelectionScreen ({Key? key}) : super(key: key);
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if(state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Error fetching weather data")
              )
            );
          } else if(state is WeatherLoaded) {
            //Navigate to WeatherDisplayScreen once data is loaded
            Navigator.push(
                context,
              MaterialPageRoute(
                  builder: (context) => WeatherDisplayScreen(weather: state.weather)
              )
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: "Enter City Name",
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                    onPressed: () async {
                      //Dispatch FetchWeather event with the selected city
                      print("Hiiii...");
                      weatherBloc.add(FetchWeather(city: _cityController.text));
                      print("Hiiii...1");

                      try {
                        await WeatherRepository.getWeather(_cityController.text);
                        // TODO: Parse the weatherData and update the state
                      } catch (e) {
                        //WeatherBloc.add(WeatherError());
                      }
                    },
                    child: const Text("Get Weather")
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
