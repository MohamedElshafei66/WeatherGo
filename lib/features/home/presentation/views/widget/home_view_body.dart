import 'package:flutter/material.dart';
import 'package:weather_go/features/home/presentation/views/widget/user_name_section.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:EdgeInsets.symmetric(horizontal:16,vertical:10),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          UserNameSection()
        ],
      ),
    );
  }
}
