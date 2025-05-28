import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/constants/image_asset.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:lottie/lottie.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boldBlueColor,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  top: 190.h,
                  child: Container(
                    height: 600.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.sp),
                        topRight: Radius.circular(35.sp),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 64.13.w,
                  child: Image.asset(
                    APPImageAsset.appbarImage2,
                    width: 294.59.w,
                    height: 131.36.h,
                  ),
                ),
                AppbarTitles(title: 'SignUp  Success ', subTitle: ''),
                Positioned(
                  top: 320.h,
                  left: 10.w,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'please wait until your information is approved,This will take some time.',
                          style: TextStyle(
                            color: greyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        margin: EdgeInsets.only(right: 40.w),
                        height: 200.sp,
                        width: 200.sp,
                        child: Lottie.asset(APPImageAsset.successSignup),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
