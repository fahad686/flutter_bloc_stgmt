import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/fetch_weather_usecase.dart';
import '../blocs/weather_bloc.dart';
import '../blocs/weather_event.dart';
import '../blocs/weather_state.dart';
import '../widgets/weather_card.dart';
import 'histroy_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   // MaterialPageRoute(builder: (context) => const HistoryScreen()),
              // );
            },
          ),
        ],

      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(FetchWeatherUseCase())
          ..add(FetchWeatherByLocation(0.0, 0.0)), // Initial dummy values
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<WeatherBloc>(context).add(RefreshWeather());
                },
                child: Column(
                  children: [
                    WeatherCard(weather: state.weather),
                    // Add hourly forecast here (dummy data or actual)
                  ],
                ),
              );
            } else if (state is WeatherError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Search for weather updates!"));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          // Navigate to search screen
        },
      ),
    );
  }
}
