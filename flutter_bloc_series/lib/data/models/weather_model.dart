class WeatherModel {
  final String city;
  final String description;
  final double temperature;
  final String condition;

  WeatherModel({
    required this.city,
    required this.description,
    required this.temperature,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      condition: json['weather'][0]['main'],
    );
  }
}
