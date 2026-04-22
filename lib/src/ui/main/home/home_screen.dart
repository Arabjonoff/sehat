import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sehat/src/bloc/profile/profile_bloc.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/ui/main/home/drawer/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    profileBloc.getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Builder(
          builder: (context) {
            return Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(AppImages.cardimage,fit: BoxFit.cover,)),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5.r),
                  width: 95.w,
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
                  padding: EdgeInsets.all(10.r),
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.white.withOpacity(0.1)
                  ),
                  child: SvgPicture.asset(AppIcons.notification),
                ),
              ],
            );
          }
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
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: 1.sw,
            height: 154.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 4),
                  child: Text("Scheduled doctor's appointment",style: AppStyles.textStyle16Medium(AppColors.red),),
                ),
                Gap(12.h),
                Row(
                  children: [
                    Gap(8),
                    Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 44.r,
                      height: 44.r,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(AppImages.cardimage,fit: BoxFit.cover,)),

                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr. Noah Thomson",style: AppStyles.textStyle14Small(AppColors.primary),),
                          Gap(4),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(6)
                            ),

                            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
                              child: Text("Dentist",style: AppStyles.textStyle12Regular(AppColors.primary),)),
                        ],
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 1.sw,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12)
                    )
                  ),
                  child: Row(
                    children: [
                      buildIconText(
                        iconPath: AppIcons.calendar,
                        text: "Feb.15",
                      ),
                      Gap(18.w),
                      buildIconText(
                        iconPath: AppIcons.clock,
                        text: "15:30",
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.white
                        ),
                        child: buildIconText(
                          iconPath: AppIcons.file,
                          text: "View details",
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Events",style: AppStyles.textStyle18Medium(AppColors.textColor),),
                Text("All",style: AppStyles.textStyle14Medium(AppColors.primary),),
              ],
            ),
          ),
          Divider(
            color: Color(0xffE2E8F0).withOpacity(0.5),
          ),
          Gap(16),
          SizedBox(
            width: 1.sw,
            height: 262.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
                itemBuilder: (ctx,index){
              return Container(
                margin: EdgeInsets.only(right: 16.w),
                width: 200.w,
                height: 262,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.sw,
                      height: 133,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16)
                        )
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16)
                          ),
                          child: Image.asset(AppImages.cardimage,fit: BoxFit.cover,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildIconText(
                            iconPath: AppIcons.calendar,
                            text: "Feb 15, 2024",
                          ),
                          Gap(6),
                          Text("Heart health matters",style: AppStyles.textStyle16Medium(AppColors.textColor),),
                          Gap(6),
                          Text("Understandin care prevention..",style: AppStyles.textStyle14Regular(AppColors.subTextColorGray),),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
  Widget buildIconText({
    required String iconPath,
    required String text,
    Color? iconColor,
    TextStyle? textStyle,
    double gap = 4.0,
    double? iconSize,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          width: iconSize ?? 16.w,
          height: iconSize ?? 16.h,
          colorFilter: iconColor != null
              ? ColorFilter.mode(iconColor, BlendMode.srcIn)
              : null,
        ),
        Gap(gap.w),
        Text(
          text,
          style: textStyle ?? AppStyles.textStyle12Regular(AppColors.textColor),
        ),
      ],
    );
  }
}
