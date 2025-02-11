import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_image.dart';
import 'package:weather_go/core/utils/app_route.dart';
import 'package:weather_go/core/utils/app_string.dart';
import 'package:weather_go/core/widgets/custom_button.dart';
class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children:[
        Image.asset(AppImage.weatherLogo),
        const SizedBox(
          height:20,
        ),
        SizedBox(
          width:MediaQuery.of(context).size.width * 0.9,
          child:CustomButton(
              onPressed:(){
                Navigator.pushReplacementNamed(context,AppRoute.logIn);
              },
              text:AppStrings.getStarted
          )
        ),

      ],
    );
  }
}
