import 'package:flutter/material.dart';
import 'day_list_item.dart';
class DayListViewItem extends StatelessWidget {
  const DayListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height:height * 0.18,
      child: GestureDetector(
        onTap:(){},
        child: ListView.builder(
          scrollDirection:Axis.horizontal,
          itemCount:3,
          itemBuilder:(context,i){
            return const Padding(
              padding:EdgeInsets.symmetric(horizontal:25),
              child:DayListItem(),
            );
          },
        ),
      ),
    );
  }
}
