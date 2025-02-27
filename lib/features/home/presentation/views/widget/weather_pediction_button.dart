import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_style.dart';
import '../../../../../core/manger/user_provider.dart';
import '../../manger/home_provider.dart';

class WeatherPredictionButton extends StatelessWidget {
  const WeatherPredictionButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UserProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Padding(
      padding:  EdgeInsets.only(left:width * 0.8),
      child: FloatingActionButton(
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(50)
        ),
        backgroundColor:AppColors.primaryColor,
        onPressed:()async{
          String prediction = await homeProvider.getWeatherPrediction();
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => AlertDialog(
              icon:const Icon(
                FontAwesomeIcons.personRunning,
                color:AppColors.whiteColor,
                size:40,
              ),
              backgroundColor:AppColors.darkBlue,
              title: Center(
                child:  Text(
                    "Hi ${userProvider.username}",
                    style:AppStyle.semiBold20(context).copyWith(
                      fontSize:24,
                      color:AppColors.whiteColor
                    ),
                ),
              ),
              content: Text(
                textAlign:TextAlign.center,
                  prediction,
                style:AppStyle.medium18(context).copyWith(
                  fontSize:19,
                  color:AppColors.primaryColor
                ),
              ),
            ),
          );
        },
        child:const Icon(
          FontAwesomeIcons.personRunning,
          size:35,
        ),
      ),
    );
  }
}

