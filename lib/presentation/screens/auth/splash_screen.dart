import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/constants/image_asset.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    // final String nextPage = context
    //                             .read<PreferencesCubit>()
    //                             .getLastVisitedPage() ;
    final String nextPage = AppRoutes.login;
    Future.delayed(const Duration(seconds: 3), () {
      navigator.pushReplacementNamed(nextPage);
    });
    return Scaffold(
      backgroundColor: boldBlueColor,
      body: Image.asset(
        APPImageAsset.splashScreen,
        fit: BoxFit.fill,
        height: 813.h,
        width: 375.w,
      ),
    );
  }
}
