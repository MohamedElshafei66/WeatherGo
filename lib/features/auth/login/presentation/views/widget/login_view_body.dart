import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_route.dart';
import 'package:weather_go/core/utils/app_string.dart';
import 'package:weather_go/core/widgets/custom_button.dart';
import 'package:weather_go/core/widgets/custom_have_account_row.dart';
import 'package:weather_go/core/widgets/custom_text_feild.dart';
import 'package:weather_go/features/auth/forgetPassword/presentation/views/widget/custom_forget_password_widget.dart';
import 'package:weather_go/features/auth/login/presentation/views/widget/login_view_header.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/helper/vaildator.dart';
import '../../manger/provider.dart';
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController emailController    = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Form(
      key:formState,
      child: Column(
        children:[
          const LoginViewHeader(
              text1:AppStrings.signInToYourNAccount,
              text2:AppStrings.signInToYourAccount
          ),
          const SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: CustomeTextField(
                hintText:AppStrings.email,
                controller:emailController,
                perfixIcon:const Icon(
                  Icons.email
                ),
                validator:(text){
                  return validatorForEmail(text, maxVal: 30, minVal: 5);
                },
            ),
          ),
          const SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: CustomeTextField(
              hintText:AppStrings.password,
              controller:passwordController,
              isPassword:true,
              validator:(text){
                return validatorForPassword(text, maxVal: 10, minVal: 5);
              },
            ),
          ),
          const SizedBox(
            height:20,
          ),
          const CustomForgetPasswordWidget(),
          const SizedBox(
            height:20,
          ),
          loginProvider.isLoading?
          const CircularProgressIndicator(
            color:AppColors.primaryColor,
          )
         : SizedBox(
            width:MediaQuery.of(context).size.width * 0.9,
            child: CustomButton(
                onPressed:(){
                 if(formState.currentState!.validate()){
                   loginProvider.login(context, emailController.text, passwordController.text);
                 }
                },
                text:AppStrings.login
            ),
          ),
          const SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.only(left:75),
            child: CustomHaveAccountRow(
                onTap:(){
                  Navigator.pushReplacementNamed(context,AppRoute.signUp);
                },
                text1:AppStrings.dontHaveAnAccount,
                text2:AppStrings.register,
            ),
          )
        ],
      ),
    );
  }
}
