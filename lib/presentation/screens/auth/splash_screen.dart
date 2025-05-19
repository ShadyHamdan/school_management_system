import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/image_asset.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    Future.delayed(const Duration(seconds: 3), () {
      navigator.pushReplacementNamed(AppRoutes.homestudent);
    });
    return Scaffold(
      body: Image.asset(
        APPImageAsset.splashScreen,
        fit: BoxFit.fill,
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}
