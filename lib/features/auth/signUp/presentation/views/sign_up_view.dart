import 'package:flutter/material.dart';
import 'package:weather_go/features/auth/signUp/presentation/views/widget/sign_up_view_body.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor:Colors.white,
      body:SignUpViewBody(),
    );
  }
}
