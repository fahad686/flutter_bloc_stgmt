import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/weather_bloc.dart';
import '../blocs/weather_event.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Enter city name",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final city = searchController.text.trim();
                    if (city.isNotEmpty) {
                      // Trigger the FetchWeatherByCity event
                      BlocProvider.of<WeatherBloc>(context)
                          .add(FetchWeatherByCity(city));
                      Navigator.pop(context); // Go back to the Home Screen
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
