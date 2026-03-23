import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sehat/src/dialog/loading_dialog.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  bool hasError = false;
  bool isFull = false;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _verifyCode() async {
    if (controller.text == "123456") {
      setState(() {
        hasError = false;
      });

      LoadingDialog.show(context);

      await Future.delayed(const Duration(seconds: 3));
      context.push('/account');

      if (mounted) {
        LoadingDialog.hide(context);
      }

    } else {
      setState(() {
        hasError = true;
      });
      // controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 48.w,
      textStyle: AppStyles.textStyle18Medium(AppColors.textColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.red, width: 1.5),
        color: AppColors.red.withOpacity(0.05),
      ),
      textStyle: AppStyles.textStyle18Medium(AppColors.red),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify your number",
                    style: AppStyles.textStyle18Medium(AppColors.textColor),
                  ),
                  Gap(4.h),
                  Text(
                    "Enter the 6 digit code sent to\n+998 90 123 45 67. Please enter it",
                    style: AppStyles.textStyle16Regular(AppColors.subTextColorGray),
                  ),
                  Gap(32.h),
                  Center(
                    child: Pinput(
                      length: 6,
                      controller: controller,
                      focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      errorPinTheme: errorPinTheme,
                      forceErrorState: hasError,
                      separatorBuilder: (index) => Gap(8.w),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,

                      onChanged: (value) {
                        setState(() {
                          isFull = value.length == 6;
                          if (hasError) hasError = false;
                        });
                      },

                      onCompleted: (pin) {
                        // 6-raqam yozilganda avtomatik tekshirish (ixtiyoriy)
                        // _verifyCode();
                      },

                      errorBuilder: (errorText, pin) {
                        return Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Center(
                            child: Text(
                              "Incorrect code, please try again",
                              style: AppStyles.textStyle16Regular(AppColors.red),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(24.h),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Qayta yuborish so'raldi");
                    },
                    child: RichText(
                      text: TextSpan(
                        style: AppStyles.textStyle16Regular(AppColors.subTextColorGray),
                        children: [
                          TextSpan(
                            text: "Didn’t get the code? ",
                            style: AppStyles.textStyle16Regular(AppColors.textColor),
                          ),
                          TextSpan(
                            text: "Resend code",
                            style: AppStyles.textStyle14Medium(AppColors.primary).copyWith(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ButtonWidget(
            isActive: isFull,
            text: "Continue",
            onTap: _verifyCode,
          ),
          Gap(34.h)
        ],
      ),
    );
  }
}