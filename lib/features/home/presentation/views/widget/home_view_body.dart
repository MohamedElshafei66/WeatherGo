import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/features/home/presentation/views/widget/user_name_section.dart';
import 'package:weather_go/features/home/presentation/views/widget/weather_details_section.dart';
import '../../manger/home_provider.dart';
import 'day_list_view_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<HomeProvider>(context, listen: false).fetchWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (homeProvider.isLoading) {
          return const Center(child:CircularProgressIndicator(
            color:AppColors.primaryColor,
          ));
        }
        else {
          return const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children:[
                      UserNameSection(),
                      WeatherDetailsSection(),
                      SizedBox(
                          height: 25
                      ),
                      Divider(
                          thickness: 1
                      ),
                      SizedBox(
                          height: 20
                      ),
                      DayListViewItem(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
