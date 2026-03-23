import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          const Center(child: Text("Appointments")),
          const Center(child: Text("Messages")),
          const Center(child: Text("Profile")),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 34.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2), // Shisha cheti (Reflection)
                  width: 0.5,
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: Colors.black38,
                items: [
                  BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navHome), label: "Home"),
                  BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navServices), label: "Services"),
                  BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navBooking), label: "Booking"),
                  BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navAnalyses), label: "Analyses"),
                  BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.navChat), label: "Chat"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}