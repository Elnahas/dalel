import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody({super.key, required this.controler, this.onPageChanged});

  final PageController controler ;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controler,
        onPageChanged: onPageChanged,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return  Column(
            children: [
              Container(
                height: 390,
                width: 343,
                decoration: BoxDecoration(
                  
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: AssetImage(onBoardingData[index].imagePath))),
              ),
             const SizedBox(
                height: 24,
              ),
              CustomSmoothPageIndicator(
                controller: controler,
              ),
             const SizedBox(
                height: 32,
              ),
              Text(
                onBoardingData[index].title,
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
             const SizedBox(
                height: 16,
              ),
              Text(
               onBoardingData[index].subTitle,
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
    );
  }
}
