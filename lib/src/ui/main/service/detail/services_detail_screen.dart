import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sehat/src/theme/app_colors.dart';

import '../../../../theme/app_styles.dart';

class ServicesDetailScreen extends StatefulWidget {
  const ServicesDetailScreen({super.key});

  @override
  State<ServicesDetailScreen> createState() => _ServicesDetailScreenState();
}

class _ServicesDetailScreenState extends State<ServicesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cardiology",style: AppStyles.textStyle16Medium(AppColors.textColor),),
        backgroundColor: AppColors.white,
        elevation: 0,),
      backgroundColor: AppColors.background,
      body: ListView(
        children: [
          Gap(10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
                bottom: Radius.circular(16)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cardiology",style: AppStyles.textStyle16Medium(AppColors.textColor)),
                Gap(12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.background
                  ),
                  child: Text("The Stomatology Service delivers comprehensive, patient-centered dental care through a coordinated, multidisciplinary team approach. We offer advanced and integrated treatment options for a wide range of oral, dental, and maxillofacial conditions.",style: AppStyles.textStyle14Small(AppColors.textColor),),

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
