import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';

class LocationSelectionScreen  extends StatelessWidget {
  LocationSelectionScreen ({Key? key}) : super(key: key);
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {

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
