import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';

class FetchWeatherUseCase {
  final WeatherRepository _repository = WeatherRepository();

  Future<WeatherModel> fetchByLocation(double lat, double lon) {
    return _repository.getWeather(lat, lon);
  }

  Future<WeatherModel> fetchByCity(String city) {
    return _repository.getWeatherByCity(city);
  }
}
