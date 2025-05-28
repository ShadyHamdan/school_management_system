import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/image_asset.dart';

class AppbarImage extends StatelessWidget {
  const AppbarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 67.4.h,
      left: 64.13.w,
      // right: 100.w,

      child: Image.asset(
        APPImageAsset.appbarImage,
        width: 294.59.w,
        height: 154.h,
      ),
    );
  }
}
