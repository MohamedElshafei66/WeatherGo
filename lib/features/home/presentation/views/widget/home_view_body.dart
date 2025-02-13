import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_route.dart';
import 'package:weather_go/core/utils/app_style.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children:[
           Text(
              "Welcome to home page",
              style:AppStyle.semiBold20(context).copyWith(
                color:AppColors.primaryColor
              ),
          ),
          IconButton(
            onPressed:(){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context,AppRoute.logIn);
            },
            icon:const Icon(
              Icons.exit_to_app_outlined,
              size:30,
              color:Colors.white
              ,
            ),
          )
        ],
      ),
    );
  }
}
