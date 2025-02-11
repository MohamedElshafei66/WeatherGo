import 'package:flutter/material.dart';
import 'package:weather_go/features/auth/forgetPassword/presentation/views/widget/forget_password_view_body.dart';
class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Colors.white,
      body:ForgetPasswordViewBody(),
    );
  }
}
