import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';

class AppbarTitles extends StatelessWidget {
  final String title;
  final String subTitle;

  const AppbarTitles({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 240.h,
      left: 30.w,
      right: 30.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: blackColortext,
              fontWeight: FontWeight.bold,
              fontSize: 34.sp,
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.1,
            child: Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: greyColor,
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
