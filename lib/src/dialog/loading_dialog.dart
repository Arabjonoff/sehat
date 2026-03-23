import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sehat/src/theme/app_colors.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56.r,
              height: 56.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffF5F5F5)
              ),
              child: PopScope(
                canPop: true,
                child: Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xff032DD3),
                    size: 40.r,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}