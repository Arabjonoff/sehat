import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';

class OnboardWidget extends StatelessWidget {
  final String image, redText, text, subtext;
  const OnboardWidget({
    super.key,
    required this.image,
    required this.redText,
    required this.text,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w), // Margin o'rniga padding qulayroq
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Matnlarni chapga tekislaydi
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              image,
              width: 1.sw,
              height: 318.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 335.w,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$redText ",
                    style: AppStyles.textStyle36Medium(AppColors.red),
                  ),
                  TextSpan(
                    text: text,
                    style: AppStyles.textStyle36Medium(AppColors.textColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            subtext,
            style: AppStyles.textStyle16Regular(AppColors.subTextColor),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}