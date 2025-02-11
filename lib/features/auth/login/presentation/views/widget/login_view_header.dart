import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_style.dart';

class LoginViewHeader extends StatelessWidget {
  const LoginViewHeader({
    super.key,
    required this.text1,
    required this.text2
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height:height * 0.29,
      width:double.infinity,
      color:AppColors.darkestBlue,
      child: Padding(
        padding:EdgeInsets.only(top:height * 0.08,left:15),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            Text(
             text1,
              style:AppStyle.semiBold35(context)
            ),
            const SizedBox(
              height:5,
            ),
            Text(
              text2,
              style:AppStyle.regular18(context)
            )
          ],
        ),
      ),
    );
  }
}
