import '../../domain/entities/weather.dart';

class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final double humidity;
  final double windSpeed;
  final String icon;
  final String cloudiness;
  final List<ForecastModel> forecast;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
    required this.forecast,
    required this.cloudiness
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["name"] ?? "Unknown",
      temperature: (json["main"]["temp"] as num?)?.toDouble() ?? 0.0,
      description: (json["weather"] != null && json["weather"].isNotEmpty)
          ? json["weather"][0]["description"] ?? "No description"
          : "No description",
      humidity: (json["main"]["humidity"] as num?)?.toDouble() ?? 0.0,
      cloudiness: (json["clouds"]["all"] as num?)?.toString() ?? "0",
      windSpeed: (json["wind"]["speed"] as num?)?.toDouble() ?? 0.0,
      icon: json["weather"]?[0]["icon"] ?? "01d",
      forecast: (json["forecast"]?["forecastday"] as List?)?.map((day) => ForecastModel.fromJson(day)).toList() ?? [],

    );
  }

  Weather toEntity() {
    return Weather(
      cityName: cityName,
      temperature: temperature,
      description: description,
      humidity: humidity,
      windSpeed: windSpeed,
      icon: icon,
      cloudiness:cloudiness,
      forecast: forecast.map((f) => f.toEntity()).toList(),
    );
  }
}

class ForecastModel {
  final DateTime date;
  final double temperature;
  final String icon;
  final double humidity;
  final double windSpeed;
  final String cloudiness;
  final String description;

  ForecastModel({
    required this.date,
    required this.temperature,
    required this.icon,
    required this.windSpeed,
    required this.humidity,
    required this.cloudiness,
    required this.description
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json["dt_txt"] != null
          ? DateTime.parse(json["dt_txt"])
          : DateTime.fromMillisecondsSinceEpoch((json["dt"] as num?)?.toInt() ?? 0 * 1000),
      temperature: (json["main"]["temp"] as num?)?.toDouble() ?? 0.0,
      icon: json["weather"]?[0]["icon"] ?? "01d",
      cloudiness: (json["clouds"]["all"] as num?)?.toString() ?? "0",
      windSpeed: (json["wind"]["speed"] as num?)?.toDouble() ?? 0.0,
      description: (json["weather"] != null && json["weather"].isNotEmpty)
          ? json["weather"][0]["description"] ?? "No description"
          : "No description",
      humidity: (json["main"]["humidity"] as num?)?.toDouble() ?? 0.0,
    );
  }

  Forecast toEntity() {
    return Forecast(
      date: date,
      temperature: temperature,
      icon: icon,
      cloudiness:cloudiness,
      humidity:humidity,
      windSpeed:windSpeed,
      description:description
    );
  }
}
