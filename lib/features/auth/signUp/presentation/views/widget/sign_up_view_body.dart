import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/app_string.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_have_account_row.dart';
import '../../../../../../core/widgets/custom_text_feild.dart';
import '../../../../login/presentation/views/widget/login_view_header.dart';
class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});
  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController nameController    = TextEditingController();
  TextEditingController emailController    = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
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
          ),
        ),
        const SizedBox(
          height:20,
        ),
        SizedBox(
          width:MediaQuery.of(context).size.width * 0.9,
          child: CustomButton(
              onPressed:(){},
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
    );
  }
}
