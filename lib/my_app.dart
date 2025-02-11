import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_route.dart';
import 'package:device_preview/device_preview.dart';
class WeatherGo extends StatelessWidget {
  const WeatherGo({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute:AppRoute.onBoarding,
      onGenerateRoute:AppRoute.generateRoute,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme:ThemeData().copyWith(
        scaffoldBackgroundColor:AppColors.darkBlue
      ),
    );
  }
}