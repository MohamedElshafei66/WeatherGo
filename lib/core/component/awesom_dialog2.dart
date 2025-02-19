import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_style.dart';

void showAwesomeDialogLogOut(
    BuildContext context,
    {
      required String title,
      required String des,
      required void Function()? btnOkOnPress,
    }){
  AwesomeDialog(
      context: context,
      dialogType:DialogType.question,
      animType: AnimType.bottomSlide,
      title:title,
      desc:des,
      titleTextStyle:AppStyle.semiBold20(context).copyWith(
          fontSize:25
      ),
      descTextStyle:AppStyle.regular18(context).copyWith(
          fontWeight:FontWeight.w500,
          fontSize:20,
          color:Colors.black
      ),
      btnOkOnPress:btnOkOnPress,
      btnCancelOnPress:(){},
      btnOkColor:AppColors.darkBlue,
      btnCancelColor:AppColors.darkBlue,
      buttonsTextStyle:AppStyle.medium18(context).copyWith(
        color:AppColors.whiteColor
      )
  ).show();
}