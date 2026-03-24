import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sehat/src/dialog/loading_dialog.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/src/widget/onboard_widget.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                OnboardWidget(
                  image: AppImages.onboard1,
                  redText: "Verified ",
                  text: "professional doctors",
                  subtext: "Every physician is board-certified, peer-reviewed and carefully vetted for your safety",
                ),
                OnboardWidget(
                  image: AppImages.onboard2,
                  redText: "Premium ",
                  text: "professional doctors",
                  subtext: "Every physician is board-certified, peer-reviewed and carefully vetted for your safety",
                ),
                OnboardWidget(
                  image: AppImages.onboard3,
                  redText: "Your rewards ",
                  text: "for choosing our care",
                  subtext: "Every physician is board-certified, peer-reviewed and carefully vetted for your safety",
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: EdgeInsets.only(right: 2.w),
                  height: 8.h,
                  width: _currentIndex == index ? 27.w : 8.w,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.primary
                        : AppColors.primary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                );
              }),
            ),
          ),
          Gap(50.h),
          ButtonWidget(text: "Next", onTap: (){
            if (_currentIndex < 2) {
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              context.push('/login');
              // LoadingDialog.show(context);
            }
          }),
          Gap(38.h)
        ],
      ),
    );
  }
}