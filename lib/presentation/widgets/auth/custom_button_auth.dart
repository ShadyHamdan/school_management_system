import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double fontSize;

  const CustomButtonAuth({super.key, required this.text, this.onPressed,this.fontSize=16.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cyanColor,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: MaterialButton(
        height: 54.h,
        onPressed: onPressed,
        textColor: whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(text, textAlign: TextAlign.center),
              titleTextStyle: TextStyle(
                fontSize: fontSize==16.0? 16.sp:fontSize.sp,
                fontWeight: FontWeight.w800,
              ),

              trailing: Icon(
                Icons.arrow_forward,
                color: whiteColor,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
