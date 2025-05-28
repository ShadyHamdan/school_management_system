import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function()? onTap;
  const CustomRichText({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: blackColortext, fontSize: 20.sp)),
          InkWell(
            onTap: onTap,
            child: Text(
              textButton,
              style: TextStyle(
                color: boldBlueColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
