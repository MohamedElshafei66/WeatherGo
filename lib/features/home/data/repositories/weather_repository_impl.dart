import 'package:weather_go/features/home/domain/repositories/weather_repository.dart';
import '../../domain/entities/weather.dart';
import '../sources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Weather> getCurrentWeather(double latitude, double longitude) async {
    return await remoteDataSource.fetchCurrentWeather(latitude, longitude);
  }

  @override
  Future<List<Forecast>> getWeatherForecast(double latitude, double longitude) async {
    return await remoteDataSource.fetchWeatherForecast(latitude, longitude);
  }

}

