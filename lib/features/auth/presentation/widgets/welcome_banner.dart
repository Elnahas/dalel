import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppStrings.appName , style: CustomTextStyles.saira700style32,),
          SizedBox(height: 18,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            SvgPicture.asset(Assets.assetsImagesVector1),
            SvgPicture.asset(Assets.assetsImagesVector2),
          ],)
        ],
      ),
      height: 290,
      decoration: BoxDecoration(color: AppColors.primaryColor),
    );
  }
}
