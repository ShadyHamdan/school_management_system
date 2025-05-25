import 'package:flutter/material.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/screens/auth/login.dart';
import 'package:school_management_system/presentation/screens/auth/splash_screen.dart';
import 'package:school_management_system/presentation/screens/home/home_Student.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => HomeStudent());

      case AppRoutes.homestudent:
        return MaterialPageRoute(builder: (_) => HomeStudent());

      // ... بقية الحالات
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
