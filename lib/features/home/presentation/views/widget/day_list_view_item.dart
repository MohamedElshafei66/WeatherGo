import 'package:flutter/material.dart';
import 'day_list_item.dart';
class DayListViewItem extends StatelessWidget {
  const DayListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SizedBox(
      height:height * 0.18,
      child: GestureDetector(
        onTap:(){},
        child: ListView.builder(
          scrollDirection:Axis.horizontal,
          itemCount:3,
          itemBuilder:(context,i){
            return  Padding(
              padding:EdgeInsets.symmetric(horizontal:width * 0.06),
              child:const DayListItem(),
            );
          },
        ),
      ),
    );
  }
}
