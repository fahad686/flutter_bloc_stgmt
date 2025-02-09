import 'package:flutter/material.dart';

class WeatherHourlyForecast extends StatelessWidget {
  final List<double> hourlyTemperatures;

  const WeatherHourlyForecast({Key? key, required this.hourlyTemperatures})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyTemperatures.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${hourlyTemperatures[index].toStringAsFixed(1)}°C"),
                  const SizedBox(height: 8),
                  Text("${index + 1}h"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
