import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_style.dart';

void showAwesomeDialog(BuildContext context,{required String title,required String des}){
  AwesomeDialog(
      context: context,
      dialogType:DialogType.noHeader,
      animType: AnimType.bottomSlide,
      title:title,
      desc:des,
      titleTextStyle:AppStyle.semiBold20(context).copyWith(
        fontSize:25
      ),
      descTextStyle:AppStyle.regular18(context).copyWith(
          fontWeight:FontWeight.w800,
          fontSize:20
      )
  ).show();
}