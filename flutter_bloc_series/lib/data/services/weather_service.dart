import 'package:dio/dio.dart';
import '../../core/constants.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio _dio = Dio();

  Future<WeatherModel> fetchWeather(double lat, double lon) async {
    final response = await _dio.get('$baseUrl/weather', queryParameters: {
      'lat': lat,
      'lon': lon,
      'appid': apiKey,
      'units': 'metric',
    });
    return WeatherModel.fromJson(response.data);
  }

  Future<WeatherModel> fetchWeatherByCity(String city) async {
    final response = await _dio.get('$baseUrl/weather', queryParameters: {
      'q': city,
      'appid': apiKey,
      'units': 'metric',
    });
    return WeatherModel.fromJson(response.data);
  }
}
