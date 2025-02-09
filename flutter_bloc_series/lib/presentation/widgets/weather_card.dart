import 'package:flutter/material.dart';
import '../../data/models/weather_model.dart';
import '../../core/utils/weather_icon_mapper.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(weather.city, style: Theme.of(context).textTheme.titleLarge),
          Image.asset(getWeatherImage(weather.condition)),
          Text(
            "${weather.temperature.toStringAsFixed(1)}°C",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(weather.description),
        ],
      ),
    );
  }
}
