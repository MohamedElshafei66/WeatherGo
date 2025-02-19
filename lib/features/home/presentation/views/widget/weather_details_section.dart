import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/app_style.dart';
class WeatherDetailsSection extends StatelessWidget {
  const WeatherDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children:[
        Center(
          child: Image.asset(
            AppImage.test2Image,
            width:width * 0.65,
          ),
        ),
        Center(
          child: Text(
            "21°",
            style:AppStyle.semiBold35(context).copyWith(
                fontSize:70
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
                  "2%",
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
                  AppImage.humidityImage,
                  width:width*0.08,
                ),
                const SizedBox(
                  height:15,
                ),
                Text(
                  "31%",
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
                  "6km/h",
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
