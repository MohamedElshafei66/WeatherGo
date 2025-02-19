import 'package:flutter/material.dart';
import 'day_list_view_item.dart';
import 'user_name_section.dart';
import 'weather_details_section.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:EdgeInsets.symmetric(horizontal:16,vertical:10),
      child: Column(
        children:[
          UserNameSection(),
          WeatherDetailsSection(),
          SizedBox(
            height:25,
          ),
          Divider(
            thickness:0.2,
          ),
          SizedBox(
            height:20,
          ),
          DayListViewItem()

        ],
      ),
    );
  }
}

