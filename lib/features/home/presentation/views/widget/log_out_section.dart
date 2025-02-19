import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/component/awesom_dialog2.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/app_string.dart';
class LogOutSection extends StatelessWidget {
  const LogOutSection({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:(){
        showAwesomeDialogLogOut(
            context,
            title:AppStrings.noteText,
            des:AppStrings.logOutHint,
            btnOkOnPress:(){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context,AppRoute.logIn);
            }
        );
      },
      icon:const Icon(
        Icons.exit_to_app_outlined,
        color:AppColors.whiteColor,
        size:30,
      ),
    );
  }
}
