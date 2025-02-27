import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../../core/servises/location_servises.dart';
import '../../data/sources/weather_prediction_remote_data_source.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/weather_use_case.dart';

class HomeProvider extends ChangeNotifier {
  final GetWeatherUseCase getWeatherUseCase;
  final WeatherPredictionRemoteDataSource weatherPredictionRemoteDataSource = WeatherPredictionRemoteDataSource();
  Weather? weather;
  List<Forecast> forecast = [];
  bool isLoading = false;
  String? errorMessage;
  List<String> nextThreeDays = [];
  int selectedDayIndex = 0;
  String? selectedDay;

  HomeProvider({required this.getWeatherUseCase}){
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      Position position = await LocationService.getCurrentLocation();
      forecast = await getWeatherUseCase.getThreeDayForecast(position.latitude, position.longitude);
      weather = await getWeatherUseCase(position.latitude, position.longitude);
      for (var i = 0; i < forecast.length; i++) {
        debugPrint("Forecast $i: ${forecast[i].date} - ${DateFormat('EEEE').format(forecast[i].date)}");
      }
      nextThreeDays = getNextThreeDays();
    } catch (e) {
      debugPrint(e.toString());
      errorMessage = "Failed to fetch weather: ${e.toString()}";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  List<String> getNextThreeDays() {
    return forecast
        .map((e) => DateFormat('EEEE').format(e.date.toLocal()))
        .toSet()
        .toList();
  }
  void selectDay(int index) {
    selectedDayIndex = index;
    weather = Weather(
      cityName: weather!.cityName,
      temperature: forecast[index].temperature - 273.15,
      description: forecast[index].description,
      humidity: forecast[index].humidity,
      windSpeed: forecast[index].windSpeed,
      icon: forecast[index].icon,
      forecast: forecast,
      cloudiness: forecast[index].cloudiness,
    );

    notifyListeners();
  }
  Future<String> getWeatherPrediction() async {
    if (forecast.isEmpty) {
      return "No forecast data available.";
    }

    try {
      final selectedForecast = forecast[selectedDayIndex];

      List<double> weatherData = [
        selectedForecast.temperature - 273.15,
        selectedForecast.humidity.toDouble(),
        selectedForecast.windSpeed,
        double.tryParse(selectedForecast.cloudiness) ?? 0.0,
        selectedForecast.icon.contains("01") ? 1.0 : 0.0,
      ];

      return await weatherPredictionRemoteDataSource
          .getWeatherPredict(weatherData);
    } catch (e) {
      return "Failed to get prediction: ${e.toString()}";
    }
  }

}
