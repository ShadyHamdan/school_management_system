import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/auth/create_profile/create_profile_cubit.dart';

class DotWidget extends StatelessWidget {
  final CreateProfileState state;
  const DotWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 70.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 4.sp,
              backgroundColor:
                  state.currentIndex == 0 ? blackColortext : greyColor,
            ),
            CircleAvatar(
              radius: 4.sp,
              backgroundColor:
                  state.currentIndex == 1 ? blackColortext : greyColor,
            ),
            CircleAvatar(
              radius: 4.sp,
              backgroundColor:
                  state.currentIndex == 2 ? blackColortext : greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
