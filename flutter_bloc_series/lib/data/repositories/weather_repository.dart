import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherRepository {
  final WeatherService _weatherService = WeatherService();

  Future<WeatherModel> getWeather(double lat, double lon) {
    return _weatherService.fetchWeather(lat, lon);
  }

  Future<WeatherModel> getWeatherByCity(String city) {
    return _weatherService.fetchWeatherByCity(city);
  }
}
