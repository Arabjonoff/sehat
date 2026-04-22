import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sehat/src/bloc/profile/profile_bloc.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/utils/cacheservice.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: profileBloc.getProfileStream,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          var data = asyncSnapshot.data!;
          return Container(
            padding: EdgeInsets.only(top: 52.h),
            width: 0.85.sw,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: 96.r,
                  height: 96.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/350x150",
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator.adaptive(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Image.asset("assets/images/profile.png"),
                  ),
                ),
                Gap(8.h),
                Text(data.firstName,style: AppStyles.textStyle16Medium(AppColors.textColor),),
                Text("ID:12345",style: AppStyles.textStyle14Small(Color(0xff68778D)),),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.h,vertical: 12),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Color(0xffEEEEEE)
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        visualDensity: VisualDensity(vertical: -1),
                        leading: SvgPicture.asset(AppIcons.navHome),
                        title: Text("Home",style: AppStyles.textStyle16MediumW400(AppColors.textColor),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -1),
                        leading: SvgPicture.asset(AppIcons.user),
                        title: Text("Edit profile",style: AppStyles.textStyle16MediumW400(AppColors.textColor),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -1),
                        leading: SvgPicture.asset(AppIcons.language),
                        title: Text("Language",style: AppStyles.textStyle16MediumW400(AppColors.textColor),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -1),
                        leading: SvgPicture.asset(AppIcons.support),
                        title: Text("Support",style: AppStyles.textStyle16MediumW400(AppColors.textColor),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -1),
                        leading: SvgPicture.asset(AppIcons.navHome),
                        title: Text("Refer a friend",style: AppStyles.textStyle16MediumW400(AppColors.textColor),),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -1),
                        leading: SvgPicture.asset(AppIcons.navHome),
                        title: Text("About application",style: AppStyles.textStyle16MediumW400(AppColors.textColor),),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: (){
                    CacheService.clear();
                    context.go("/login");
                  },
                  contentPadding: EdgeInsets.only(left: 26.w),
                  leading: SvgPicture.asset(AppIcons.logout),
                  title: Text("Log out",style: AppStyles.textStyle16Medium(AppColors.red),),
                ),
              ],
            ),
          );
        }else{
          return Container();
        }
      }
    );
  }
}
