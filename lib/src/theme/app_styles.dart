import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle _baseStyle(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontFamily: 'Montreal',
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle textStyle36Medium(Color color) =>
      _baseStyle(36, FontWeight.w500, color);

  static TextStyle textStyle18Medium(Color color) =>
      _baseStyle(18, FontWeight.w500, color);

  static TextStyle textStyle16Medium(Color color) =>
      _baseStyle(16, FontWeight.w500, color);

  static TextStyle textStyle16Regular(Color color) =>
      _baseStyle(16, FontWeight.w400, color);

  static TextStyle textStyle14Medium(Color color) =>
      _baseStyle(14, FontWeight.w600, color);

  static TextStyle textStyle14Small(Color color) =>
      _baseStyle(14, FontWeight.w500, color);

  static TextStyle textStyle14Regular(Color color) =>
      _baseStyle(14, FontWeight.w500, color);

  static TextStyle textStyle12Regular(Color color) =>
      _baseStyle(12, FontWeight.w500, color);
}