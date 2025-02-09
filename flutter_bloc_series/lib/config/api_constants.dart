class ApiConstants {
 static  String ?url ;

  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '15f936dfd7f778305ff2204ca51da17d';

  static String weatherByCity(String city) => '$baseUrl/weather?q=$city&appid=$apiKey&units=metric';

  static String weatherByCoordinates(double lat, double lon) =>
      '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

  static String hourlyForecastByCity(String city) =>
      '$baseUrl/forecast?q=$city&appid=$apiKey&units=metric';
}
