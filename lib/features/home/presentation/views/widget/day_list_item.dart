import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_style.dart';
import '../../manger/home_provider.dart';

class DayListItem extends StatelessWidget {
  const DayListItem({super.key,
    required this.day,
    required this.icon,
    required this.temperature,
    required this.index,
  });
  final String day;
  final String icon;
  final double temperature;
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    double celsiusTemperature = temperature - 273.15;
    return GestureDetector(
      onTap:(){
        homeProvider.selectDay(index);
      },
      child: Container(
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
              "${celsiusTemperature.toStringAsFixed(0)}°",
              style:AppStyle.medium18(context).copyWith(
                  color:AppColors.darkestBlue,
                  fontSize:22,
                  fontWeight:FontWeight.w700
              ),
            ),
            Image.network(
              "https://openweathermap.org/img/wn/$icon.png",
            ),
            FittedBox(
              child: Text(
               day,
                style:AppStyle.semiBold20(context).copyWith(
                  color:AppColors.darkestBlue,
                  fontSize:20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}