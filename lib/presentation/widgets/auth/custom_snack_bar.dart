import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red[300],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Icon(Icons.error, color: whiteColor),
        ],
      ),
    ),
  );
}
