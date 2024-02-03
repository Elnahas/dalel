import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.color, required this.text,  this.onPressed});
  final Color? color;
  final String text;
  final VoidCallback? onPressed ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        
          style: ElevatedButton.styleFrom(
            
              backgroundColor: color ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(
            text,
            style: CustomTextStyles.poppins500style18
                .copyWith(color: AppColors.offWhite),
          )),
    );
  }
}
