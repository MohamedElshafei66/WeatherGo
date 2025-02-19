import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_route.dart';
class WeatherGo extends StatelessWidget {
  const WeatherGo({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute:FirebaseAuth.instance.currentUser == null ? AppRoute.onBoarding : AppRoute.home,
      onGenerateRoute:AppRoute.generateRoute,
      theme:ThemeData().copyWith(
        scaffoldBackgroundColor:AppColors.darkBlue
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}