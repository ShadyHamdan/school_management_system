import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomEmailField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const CustomEmailField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 335.w,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        style: TextStyle(color: darkBlueGrayColor, fontSize: 16.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: greyColor, fontWeight: FontWeight.w300),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
        ),
      ),
    );
  }
}
