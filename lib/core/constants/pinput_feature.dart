import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:school_management_system/core/constants/color.dart';

final defaultPinTheme = PinTheme(
  width: 47.872.w,
  height: 66.h,
  textStyle: TextStyle(
    fontSize: 20.sp,
    color: darkBlueGrayColor,
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    color: whiteColor,
    border: Border.all(color: greyColor),
    borderRadius: BorderRadius.circular(15.sp),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(120),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 1.5.w),
      ),
    ],
  ),
);

final successpinTheme = PinTheme(
  width: 47.872.w,
  height: 66.h,
  textStyle: TextStyle(
    fontSize: 20.sp,
    color: darkBlueGrayColor,
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    color: whiteColor,
    border: Border.all(color: const Color.fromARGB(255, 0, 171, 6)),
    borderRadius: BorderRadius.circular(15.sp),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(120),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 1.5.w),
      ),
    ],
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  color: whiteColor,
  border: Border.all(color: greyColor),
  borderRadius: BorderRadius.circular(15.sp),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withAlpha(120),
      spreadRadius: 0,
      blurRadius: 2,
      offset: Offset(0, 1.5.w),
    ),
  ],
);

final errorpinTheme = defaultPinTheme.copyDecorationWith(
  color: whiteColor,
  border: Border.all(color: Colors.red),
  borderRadius: BorderRadius.circular(15.sp),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withAlpha(120),
      spreadRadius: 0,
      blurRadius: 2,
      offset: Offset(0, 1.5.w),
    ),
  ],
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    borderRadius: BorderRadius.circular(15.sp),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(120),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 1.5.w),
      ),
    ],
  ),
);
