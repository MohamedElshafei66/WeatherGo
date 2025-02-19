import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/manger/user_provider.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return  SizedBox(
      width:double.infinity,
      child:Center(
        child:Text("${userProvider.username}"),
      ),
    );
  }
}
