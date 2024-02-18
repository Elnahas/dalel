import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [HistoricalPeriodItem(), HistoricalPeriodItem()],
    );
  }
}

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey, blurRadius: 10, offset: Offset(0, 7))
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 16,),
        SizedBox(
            height: 48,
            width: 62,
            child: Text(
              "Ancient Egypt",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18
                  .copyWith(fontSize: 15, color: AppColors.deepBrown),
            )),
        Container(
          height: 64,
          width: 47,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(Assets.assetsImagesFrame))),

        ),

        SizedBox(width: 16,),
      ]),
    );
  }
}
