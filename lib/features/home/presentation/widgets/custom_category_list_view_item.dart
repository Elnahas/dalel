import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey, blurRadius: 10, offset: Offset(0, 7))
          ]),
      child: Column(children: [
        Container(
          width: 74,
          height: 96,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(
                    Assets.assetsImagesFrame3,
                  ),
                  fit: BoxFit.fill)),
        ),
        const SizedBox(height: 11),
        Text(
          "Liongeart",
          style: CustomTextStyles.poppins500style14,
        )
      ]),
    );
  }
}
