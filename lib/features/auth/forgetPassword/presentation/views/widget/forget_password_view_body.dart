import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_route.dart';
import 'package:weather_go/core/widgets/custom_button.dart';
import 'package:weather_go/core/widgets/custom_have_account_row.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../../../../core/widgets/custom_text_feild.dart';
import '../../../../login/presentation/views/widget/login_view_header.dart';
import 'package:provider/provider.dart';
import '../../manger/forget_password_provider.dart';
class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController emailController    = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final forgetProvider = Provider.of<ForgetPasswordProvider>(context);
    return Column(
      children:[
         const LoginViewHeader(
            text1:AppStrings.forgetYourPassword,
            text2:AppStrings.changeYourPasswordNow
        ),
         const SizedBox(
          height:20,
        ),
         Padding(
          padding:const EdgeInsets.symmetric(horizontal:20),
          child: CustomeTextField(
            hintText:AppStrings.email,
            controller:emailController,
            perfixIcon:const Icon(
                Icons.email
            ),
          ),
        ),
         const SizedBox(
          height:20,
        ),
        forgetProvider.isLoading ?
        const CircularProgressIndicator(
          color:AppColors.primaryColor,
        )
         :CustomButton(
             onPressed:(){
               forgetProvider.resetPassword(context, emailController.text);
             },
             text:AppStrings.reset
         ),
         const SizedBox(
          height:20,
        ),
         Padding(
          padding: const EdgeInsets.only(left:70),
          child: CustomHaveAccountRow(
              onTap:(){
                Navigator.pushReplacementNamed(context,AppRoute.logIn);
              },
              text1:AppStrings.rememberPassword,
              text2:AppStrings.login,
          ),
        )
      ],
    );
  }
}
