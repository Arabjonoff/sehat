import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sehat/src/api_service/repository.dart';
import 'package:sehat/src/dialog/app_toast.dart';
import 'package:sehat/src/dialog/loading_dialog.dart';
import 'package:sehat/src/model/http_result.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/utils/cacheservice.dart';

class VerificationScreen extends StatefulWidget {
  final String phone,isRegister;
  const VerificationScreen({super.key, required this.phone, required this.isRegister});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final Repository _repository = Repository();

  bool hasError = false;
  bool isFull = false;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _verifyCode() async {
    LoadingDialog.show(context);
    Map data = {
      "phone": "+${widget.phone.replaceAll(" ", "")}",
      "code": controller.text,
    };
    if(widget.isRegister == "true"){
      HttpResult result = await _repository.verifyRegister(data);
      if (result.status >= 200 && result.status < 299) {
        setState(() {
          hasError = false;
        });
        await Future.delayed(const Duration(seconds: 3));
        CacheService.saveToken(result.result['access']);
        context.push('/main');
        if (mounted) {
          LoadingDialog.hide(context);
        }
      } else {
        LoadingDialog.hide(context);
        AppToast.error(context: context, description: result.result['code'].toString());
        setState(() {
          hasError = true;
        });
        // controller.clear();
      }
    }else{
      HttpResult result = await _repository.verifyLogin(data);
      if (result.status >= 200 && result.status < 299) {
        setState(() {
          hasError = false;
        });
        CacheService.saveToken(result.result['access']);
        await Future.delayed(const Duration(seconds: 3));
        widget.isRegister == "true" ? context.push('/account'): context.push('/main');

        if (mounted) {
          LoadingDialog.hide(context);
        }
      } else {
        LoadingDialog.hide(context);
        AppToast.error(context: context, description: result.result['code'].toString());
        setState(() {
          hasError = true;
        });
        // controller.clear();
      }
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
                    "Enter the 6 digit code sent to\n${widget.phone.replaceAll(" ", "")}. Please enter it",
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
                    onTap: () async{
                      LoadingDialog.show(context);
                      Map data = {
                        "phone": "${widget.phone.replaceAll(" ", "")}",
                      };
                      HttpResult res = await _repository.resendOtp(data);
                      if(res.status >= 200&&res.status < 299){
                        LoadingDialog.hide(context);
                        AppToast.success(context: context, description: "Yangi kod yuborildi");
                      }else{
                        LoadingDialog.hide(context);
                        AppToast.error(context: context, description: res.result['phone']??["code"].toString());
                      }
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