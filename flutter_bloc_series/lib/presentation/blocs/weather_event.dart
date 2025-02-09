import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeatherByLocation extends WeatherEvent {
  final double latitude;
  final double longitude;

  FetchWeatherByLocation(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}

class FetchWeatherByCity extends WeatherEvent {
  final String city;

  FetchWeatherByCity(this.city);

  @override
  List<Object?> get props => [city];
}

class RefreshWeather extends WeatherEvent {}
