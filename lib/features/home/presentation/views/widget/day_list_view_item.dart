import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../manger/home_provider.dart';
import 'day_list_item.dart';
class DayListViewItem extends StatelessWidget {
  const DayListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    final homeProvider = Provider.of<HomeProvider>(context);
    return SizedBox(
      height:height * 0.18,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount:homeProvider.forecast.length,
        itemBuilder:(context,i){
          final dayData = homeProvider.forecast[i];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: DayListItem(
              day: "${dayData.humidity}%",
              icon: dayData.icon,
              temperature: dayData.temperature,
              index:i,
            ),
          );
        },
      ),
    );
  }
}
