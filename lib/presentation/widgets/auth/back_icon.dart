import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5.h,
      left:
          context.read<PreferencesCubit>().getSavedLocale() == Locale('en')
              ? 5.w
              : 320.w,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 24.sp, color: whiteColor),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
