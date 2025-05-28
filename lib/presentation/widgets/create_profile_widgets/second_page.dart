import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Column secondPage(
  TextEditingController yearController,
  TextEditingController monthController,
  TextEditingController dayController,
  BuildContext context,
) {
  final locale = AppLocalizations.of(context)!;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 160.h),
      Text(
        locale.enterYourDateOfBirth,

        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: greyColor,
          fontSize: 20.sp,
        ),
      ),
      SizedBox(height: 50.h),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w),
              alignment: Alignment.center,
              width: 70.w,
              child: TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.datetime,
                controller: dayController,
                style: TextStyle(color: darkBlueGrayColor, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: locale.day,
                  hintStyle: TextStyle(
                    color: greyColor,
                    fontWeight: FontWeight.w300,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackColortext),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              alignment: Alignment.center,
              width: 70.w,
              child: TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.datetime,
                controller: monthController,
                style: TextStyle(color: darkBlueGrayColor, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: locale.month,
                  hintStyle: TextStyle(
                    color: greyColor,
                    fontWeight: FontWeight.w300,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackColortext),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              width: 70.w,
              child: TextFormField(
                maxLength: 4,
                keyboardType: TextInputType.datetime,
                controller: yearController,
                style: TextStyle(color: darkBlueGrayColor, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: locale.year,
                  hintStyle: TextStyle(
                    color: greyColor,
                    fontWeight: FontWeight.w300,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackColortext),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
