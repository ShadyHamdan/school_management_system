import 'package:flutter/material.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/screens/auth/code_confirm.dart';
import 'package:school_management_system/presentation/screens/auth/create_password.dart';
import 'package:school_management_system/presentation/screens/auth/create_profile.dart';
import 'package:school_management_system/presentation/screens/auth/login.dart';
import 'package:school_management_system/presentation/screens/auth/signup.dart';
import 'package:school_management_system/presentation/screens/auth/splash_screen.dart';
import 'package:school_management_system/presentation/screens/auth/waiting_page.dart';
import 'package:school_management_system/presentation/screens/home/home_Student.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.createPassword:
        return MaterialPageRoute(builder: (_) => CreatePassword());

      case AppRoutes.waitingPage:
        return MaterialPageRoute(builder: (_) => WaitingPage());

      case AppRoutes.createProfile:
        return MaterialPageRoute(builder: (_) => CreateProfile());

      case AppRoutes.login: //عدلت لاقدر اشتغل بالهوم
        return MaterialPageRoute(builder: (_) => HomeStudent());

      case AppRoutes.signup:
        final signupArgs = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => Signup(previosPage: signupArgs),
        );

      case AppRoutes.codeConfirm:
        return MaterialPageRoute(builder: (_) => CodeConfirm());

      case AppRoutes.homestudent:
        return MaterialPageRoute(builder: (_) => HomeStudent());

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
