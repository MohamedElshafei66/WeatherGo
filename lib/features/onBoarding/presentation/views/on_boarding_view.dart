import 'package:flutter/material.dart';
import 'package:weather_go/features/onBoarding/presentation/views/widget/on_boarding_view_body.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:OnBoardingViewBody(),
    );
  }
}
