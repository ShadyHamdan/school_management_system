
import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

class AppbarTitles extends StatelessWidget {
  const AppbarTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 222,
      left: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: TextStyle(
              color: blackColortext,
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Sign in to continue',
            style: TextStyle(
              color: greyColor,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}