import '../entities/weather.dart';
abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(double latitude, double longitude);
  Future<List<Forecast>> getWeatherForecast(double latitude, double longitude);
}
