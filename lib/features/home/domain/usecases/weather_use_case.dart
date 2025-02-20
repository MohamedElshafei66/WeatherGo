import 'package:weather_go/features/home/domain/repositories/weather_repository.dart';
import '../entities/weather.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);

  Future<Weather> call(double latitude, double longitude) async {
    return await weatherRepository.getCurrentWeather(latitude, longitude);
  }

  Future<List<Forecast>> getThreeDayForecast(double latitude, double longitude) async {
    return await weatherRepository.getWeatherForecast(latitude, longitude);
  }
}