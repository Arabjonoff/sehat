import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
// O'zingizning pathlaringizni tekshirib oling
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/ui/main/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Services")),
    const Center(child: Text("Booking")),
    const Center(child: Text("Analyses")),
    const Center(child: Text("Chat")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 30.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            height: 74.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(AppIcons.navHome,AppIcons.navActiveHome, "Home", 0),
                _buildNavItem(AppIcons.navServices,AppIcons.navActiveServices, "Services", 1),
                _buildNavItem(AppIcons.navBooking,AppIcons.navActiveServices, "Booking", 2),
                _buildNavItem(AppIcons.navAnalyses,AppIcons.navAnalyses, "Analyses", 3),
                _buildNavItem(AppIcons.navChat,AppIcons.navChat, "Chat", 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon,activeicon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _selectedIndex = index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected?activeicon:icon,
              width: 22.w,
              height: 22.h,

            ),
            Gap(6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary : Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}