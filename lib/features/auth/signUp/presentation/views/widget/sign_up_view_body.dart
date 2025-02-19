import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_have_account_row.dart';
import '../../../../../../core/widgets/custom_text_feild.dart';
import '../../../../login/presentation/views/widget/login_view_header.dart';
import 'package:provider/provider.dart';
import '../../manger/provider.dart';
import '../../../../../../core/helper/vaildator.dart';
class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});
  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController nameController    = TextEditingController();
  TextEditingController emailController    = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);
    return Form(
      key:formState,
      child: Column(
        children:[
          const LoginViewHeader(
              text1:AppStrings.signUpToYourAccount,
              text2:AppStrings.createYourAccount
          ),
          const SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: CustomeTextField(
              hintText:AppStrings.name,
              controller:nameController,
              perfixIcon:const Icon(
                  Icons.person
              ),
              validator:(text){
                return validatorForName(text, maxVal:10 ,minVal:5);
              },
            ),
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
          signupProvider.isLoading?
          const CircularProgressIndicator(
            color:AppColors.primaryColor,
          )
         : SizedBox(
            width:MediaQuery.of(context).size.width * 0.9,
            child: CustomButton(
                onPressed:(){
                  if(formState.currentState!.validate()){
                    signupProvider.signup(context,
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                    );
                  }
                },
                text:AppStrings.register
            ),
          ),
          const SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.only(left:100),
            child: CustomHaveAccountRow(
              onTap:(){
                Navigator.pushReplacementNamed(context,AppRoute.logIn);
              },
              text1:AppStrings.iHaveAnAccount,
              text2:AppStrings.login,
            ),
          )
        ],
      ),
    );
  }
}
