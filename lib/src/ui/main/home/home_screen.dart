import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(

          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5.r),
              width: 88.w,
              height: 36.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.white.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.giftbox),
                  Gap(4.w),
                  Text("20.000",style: AppStyles.textStyle14Medium(AppColors.white),)
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.white.withOpacity(0.1)
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r))
        ),
        backgroundColor: AppColors.primary,
        bottom: PreferredSize(preferredSize: Size.fromHeight(64.h), child: Container(
          margin: EdgeInsets.only(bottom: 12.h,left: 16.w,right: 16.w),
          width: 1.sw,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24)
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for service or doctors...",
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(AppIcons.search),
              )
            ),
          ),
        )),
      ),
      body: ListView(
        children: [
          Gap(20.h),
          SizedBox(
            width: 1.sw,
            height: 64,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,index){
              return Container(
                margin: EdgeInsets.only(right: 10),
                width: 64.r,
                height: 64.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset("assets/images/story${index+1}.png"),
              );
            }),
          ),
          Gap(14.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: 1.sw,
            height: 154.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Events",style: AppStyles.textStyle18Medium(AppColors.textColor),),
                Text("All",style: AppStyles.textStyle14Medium(AppColors.primary),),
              ],
            ),
          ),
          SizedBox(
            width: 1.sw,
            height: 252.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,index){
              return Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 200.w,
                height: 252,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
