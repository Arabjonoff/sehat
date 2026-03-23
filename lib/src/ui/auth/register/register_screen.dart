import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart'; // 1. Import
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controllerPhone = TextEditingController();
  bool isFull = false;
  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s start with your phone number",
                    style: AppStyles.textStyle18Medium(AppColors.textColor),
                  ),
                  Gap(4.h),
                  Text(
                    "We will text you a code to verify your identity.",
                    style: AppStyles.textStyle16Regular(AppColors.subTextColorGray),
                  ),
                  Gap(24.h),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Phone number",
                        style: AppStyles.textStyle14Medium(AppColors.textColor),
                      ),
                      TextSpan(
                        text: " *",
                        style: AppStyles.textStyle14Medium(AppColors.red),
                      ),
                    ]),
                  ),
                  Gap(8.h),
                  TextField(
                    controller: controllerPhone,
                    inputFormatters: [maskFormatter], // 3. Maskani ulash
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      setState(() {
                        isFull = val.length == 17;
                      });
                    },
                    style: AppStyles.textStyle14Medium(AppColors.textColor),
                    decoration: InputDecoration(
                      hintText: "+998 _ _  _ _ _  _ _  _ _",
                      hintStyle: AppStyles.textStyle16Regular(AppColors.subTextColorGray.withOpacity(0.5)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      filled: true,
                      fillColor: Colors.white,
                      // Borderlar dizayni
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: Color(0xffE2E8F0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(16.h), // Tugma va matn orasidagi masofa
          Padding(
            padding: EdgeInsets.only(left: 28.0.w,bottom: 24.h),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: RichText(
                text: TextSpan(
                  style: AppStyles.textStyle16Regular(AppColors.subTextColorGray),
                  children: [
                    TextSpan(text: "Already have an account? ",
                    style: AppStyles.textStyle16Regular(AppColors.textColor)),
                    TextSpan(
                      text: "Log in",
                      style: AppStyles.textStyle14Medium(AppColors.primary).copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ButtonWidget(
            isActive: isFull,
            text: "Continue",
            onTap: () {
              String fullNumber = maskFormatter.getUnmaskedText();
              context.push('/verification');
            },
          ),
          Gap(34.h)
        ],
      ),
    );
  }
}