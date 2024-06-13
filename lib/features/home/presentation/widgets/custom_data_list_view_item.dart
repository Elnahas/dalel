import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/model/data_model.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem({super.key, required this.model});

  final DataModel model;

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
        SizedBox(
          width: 16,
        ),
        SizedBox(
            height: 48,
            width: 62,
            child: Text(
              model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18
                  .copyWith(fontSize: 15, color: AppColors.deepBrown),
            )),
        Container(
          height: 64,
          width: 47,
          child: CachedNetworkImage(
            imageUrl: model.image,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: Colors.white,
              child: Container(
                width: 47,
                height: 64,
                color: AppColors.grey,
              ),
            ),

            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          // decoration:  BoxDecoration(
          //     image:
          //         DecorationImage(image: NetworkImage(historicalPeriodsModel.image))),
        ),
        SizedBox(
          width: 16,
        ),
      ]),
    );
  }
}
