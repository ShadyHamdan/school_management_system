import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;
  const CustomEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 335,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: darkBlueGrayColor, fontSize: 16),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
        ),
      ),
    );
  }
}
