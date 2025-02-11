import 'package:flutter/material.dart';
import 'app_color.dart';

class AppStyle {
  static TextStyle semiBold20(BuildContext context){
    return  TextStyle(
        fontSize:getResponsive(context, fontSize:20),
        fontWeight:FontWeight.w600,
        color:AppColors.darkestBlue
    );
  }
  static TextStyle semiBold35(BuildContext context){
    return TextStyle(
        fontSize:getResponsive(context, fontSize: 35),
        fontWeight:FontWeight.w600,
        color:Colors.white
    );
  }
  static TextStyle regular18(BuildContext context){
    return TextStyle(
        color:Colors.grey,
        fontSize:getResponsive(context, fontSize:18),
        fontWeight:FontWeight.w400
    );
  }
  static TextStyle medium18(BuildContext context){
    return TextStyle(
        color:Colors.grey,
        fontSize:getResponsive(context, fontSize:18),
        fontWeight:FontWeight.w500
    );
  }
}
double getResponsive(BuildContext context,{required double fontSize}){
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize  = scaleFactor * fontSize;
  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;
  return  responsiveFontSize.clamp(lowerLimit, upperLimit);
}
double getScaleFactor(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  if (width < 600 ){
    return width / 400;
  }
  else if(width < 900){
    return width / 700;
  }
  else{
    return width / 1000;
  }
}