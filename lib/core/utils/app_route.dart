import 'package:flutter/material.dart';
import 'package:weather_go/features/auth/forgetPassword/presentation/views/forget_password_view.dart';
import 'package:weather_go/features/auth/login/presentation/views/login_view.dart';
import 'package:weather_go/features/auth/signUp/presentation/views/sign_up_view.dart';
import '../../features/onBoarding/presentation/views/on_boarding_view.dart';

abstract class AppRoute {
  static const String onBoarding   = "/onBoarding";
  static const String signUp       = "/signup";
  static const String logIn        = "/login";
  static const String forgetPass   = "/forgetPass";

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case logIn:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case forgetPass:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordView());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
