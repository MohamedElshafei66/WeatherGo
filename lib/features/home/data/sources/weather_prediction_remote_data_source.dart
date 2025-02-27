import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_go/core/utils/app_string.dart';

class WeatherPredictionRemoteDataSource {
  Future<String> getWeatherPredict(List<double> weatherData) async {
    const String apiUrl = 'http://10.0.2.2:5001/predict';

    if (weatherData.length != 5) {
      throw Exception("Weather data list must contain exactly 5 values.");
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'features': weatherData}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['prediction'][0] == 1 ?
        AppStrings.goodWeatherMessage : AppStrings.badWeatherMessage;
      } else {
        throw Exception("Failed to fetch weather prediction");
      }
    } catch (e) {
      throw Exception("Error fetching prediction: $e");
    }
  }
}
