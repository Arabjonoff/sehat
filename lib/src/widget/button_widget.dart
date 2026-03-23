import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double? width;
  final double? height;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        width: width ?? 1.sw,
        height: height ?? 54.h,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(100.r),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyles.textStyle18Medium(Colors.white),
        ),
      ),
    );
  }
}