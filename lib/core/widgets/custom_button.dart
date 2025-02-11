import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key
    ,required this.onPressed,
     required this.text
  });
 final void Function()? onPressed;
 final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onPressed,
      shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(8),
          side:const BorderSide(
              color:Colors.transparent
          )
      ),
      color:AppColors.primaryColor,
      child:Padding(
        padding:const EdgeInsets.symmetric(horizontal:20,vertical:10),
        child:Text(
            text,
            style:AppStyle.semiBold20(context)
        ),
      ),
    );
  }
}
