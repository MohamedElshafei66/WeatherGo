import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_route.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../../../../core/utils/app_style.dart';

class CustomForgetPasswordWidget extends StatelessWidget {
  const CustomForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:18),
      child: GestureDetector(
        onTap:(){
          Navigator.pushReplacementNamed(context,AppRoute.forgetPass);
        },
        child: Align(
          alignment:Alignment.centerRight,
          child: Text(
            AppStrings.forgotPassword,
            style:AppStyle.semiBold20(context).copyWith(
                fontWeight:FontWeight.w800,
                color:AppColors.primaryColor
            ),
          ),
        ),
      ),
    );
  }
}
