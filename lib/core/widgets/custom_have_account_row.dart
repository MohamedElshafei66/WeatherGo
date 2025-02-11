import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_style.dart';
class CustomHaveAccountRow extends StatelessWidget {
  const CustomHaveAccountRow({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap
  });
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Text(
          text1,
          style:AppStyle.regular18(context).copyWith(
            color:Colors.black,
            fontWeight:FontWeight.w500
          ),
        ),
        const SizedBox(
          width:5,
        ),
        GestureDetector(
          onTap:onTap,
          child: Text(
            text2,
            style:AppStyle.regular18(context).copyWith(
                color:AppColors.primaryColor,
                fontWeight:FontWeight.w800
            ),
          ),
        )
      ],
    );
  }
}
