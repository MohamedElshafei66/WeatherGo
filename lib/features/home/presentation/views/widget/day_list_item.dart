import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_image.dart';
import 'package:weather_go/core/utils/app_style.dart';

class DayListItem extends StatelessWidget {
  const DayListItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Container(
      width:width * 0.19,
      height:height * 0.18,
      decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(15),
          color:Colors.white30
      ),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children:[
          Text(
            "21°",
            style:AppStyle.medium18(context).copyWith(
                color:AppColors.darkestBlue,
                fontSize:22,
                fontWeight:FontWeight.w700
            ),
          ),
          Image.asset(
            AppImage.testImage,
            width:width * 0.12,
          ),
          Text(
            "Friday",
            style:AppStyle.medium18(context).copyWith(
                color:AppColors.darkestBlue
            ),
          ),
        ],
      ),
    );
  }
}