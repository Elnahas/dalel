import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({super.key, required this.currentIndex, required this.controller});

final int currentIndex ;
final PageController controller;
  @override
  Widget build(BuildContext context) {
    return               currentIndex == onBoardingData.length - 1
                  ? Column(
                      children: [
                        CustomBtn(
                            text: AppStrings.createAccount,
                            onPressed: () {
                              customReplacementNavigate(context, "/signUp");
                            }),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                              customReplacementNavigate(context, "/signIn");
                          },
                          child: Text(
                            AppStrings.loginNow,
                            style: CustomTextStyles.poppins300style16
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    )
                  : CustomBtn(
                      text: AppStrings.next,
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceIn);
                      });
  }
}
