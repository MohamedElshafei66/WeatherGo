import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_go/features/home/presentation/views/widget/log_out_section.dart';
import '../../../../../core/manger/user_provider.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
class UserNameSection extends StatelessWidget {
  const UserNameSection({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        Row(
          children:[
            Text(
              AppStrings.welcomeText,
              style:AppStyle.semiBold20(context).copyWith(
                  color:AppColors.primaryColor,
                  fontSize:25
              ),
            ),
            const SizedBox(
              width:5,
            ),
            Image.asset(
              AppImage.waveHandLogo,
              width:width * 0.09,
            ),
            const Spacer(),
            const LogOutSection()
          ],
        ),
        Text(
          "${userProvider.username}",
          style:AppStyle.semiBold20(context).copyWith(
              color:AppColors.whiteColor,
              fontSize:25,
              fontStyle:FontStyle.italic
          ),
        ),
      ],
    );
  }
}
