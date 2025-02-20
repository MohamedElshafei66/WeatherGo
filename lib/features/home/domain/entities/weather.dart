class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final double humidity;
  final double windSpeed;
  final String icon;
  final String cloudiness;
  final List<Forecast> forecast;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
    required this.forecast,
    required this.cloudiness
  });
}

class Forecast {
  final DateTime date;
  final double temperature;
  final String icon;
  final double humidity;
  final double windSpeed;
  final String cloudiness;
  final String description;

  const Forecast({
    required this.date,
    required this.temperature,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.cloudiness,
    required this.description
  });
}