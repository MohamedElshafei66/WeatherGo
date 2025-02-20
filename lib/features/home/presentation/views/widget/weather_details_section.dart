import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/app_style.dart';
import '../../manger/home_provider.dart';
class WeatherDetailsSection extends StatelessWidget {
  const WeatherDetailsSection({super.key,});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final homeProvider = Provider.of<HomeProvider>(context);
    return Column(
      children:[
        Center(
          child: Image.network(
            "https://openweathermap.org/img/wn/${homeProvider.weather?.icon}@4x.png",
          ),
        ),
        Center(
          child: Text(
        "${homeProvider.weather?.temperature.toStringAsFixed(0) ?? "--"}°",
            style:AppStyle.semiBold35(context).copyWith(
                fontSize:70
            ),
          ),
        ),
        Center(
          child: Text(
          homeProvider.weather?.description ?? "--",
            style:AppStyle.semiBold35(context).copyWith(
                fontSize:25,
                fontWeight:FontWeight.w500
            ),
          ),
        ),
        const SizedBox(
          height:20,
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children:[
            Column(
              children:[
                Image.asset(
                  AppImage.cloudyImage,
                  width:width*0.13,
                ),
                const SizedBox(
                  height:15,
                ),
                Text(
                  "${homeProvider.weather?.cloudiness ?? "--"}%",
                  style:AppStyle.medium18(context).copyWith(
                      fontSize:25,
                      color:AppColors.whiteColor
                  ),
                )
              ],
            ),
            const SizedBox(
              width:3,
            ),
            Column(
              children:[
                Image.asset(
                  AppImage.humidityImage,
                  width:width*0.08,
                ),
                const SizedBox(
                  height:15,
                ),
                Text(
                  "${homeProvider.weather?.humidity ?? "--"}%",
                  style:AppStyle.medium18(context).copyWith(
                      fontSize:25,
                      color:AppColors.whiteColor
                  ),
                )
              ],
            ),
            Column(
              children:[
                Image.asset(
                  AppImage.windSpeedImage,
                  width:width*0.12,
                ),
                const SizedBox(
                  height:3,
                ),
                Text(
                  "${homeProvider.weather?.windSpeed ?? "--"} km/h",
                  style:AppStyle.medium18(context).copyWith(
                      fontSize:22,
                      color:AppColors.whiteColor
                  ),
                )
              ],
            ),

          ],
        ),
      ],
    );
  }
}
