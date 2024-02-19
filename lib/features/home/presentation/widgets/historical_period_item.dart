import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.historicalPeriodsModel});

final HistoricalPeriodsModel historicalPeriodsModel ;

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
              historicalPeriodsModel.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18
                  .copyWith(fontSize: 15, color: AppColors.deepBrown),
            )),
        Container(
          height: 64,
          width: 47,
          decoration:  BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(historicalPeriodsModel.image))),

        ),

        SizedBox(width: 16,),
      ]),
    );
  }
}
