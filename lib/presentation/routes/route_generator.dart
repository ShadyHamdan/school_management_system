import 'package:flutter/material.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/screens/auth/code_confirm.dart';
import 'package:school_management_system/presentation/screens/auth/create_password.dart';
import 'package:school_management_system/presentation/screens/auth/create_profile.dart';
import 'package:school_management_system/presentation/screens/auth/login.dart';
import 'package:school_management_system/presentation/screens/auth/signup.dart';
import 'package:school_management_system/presentation/screens/auth/splash_screen.dart';
import 'package:school_management_system/presentation/screens/auth/waiting_page.dart';
import 'package:school_management_system/presentation/screens/home/home_Guardian/home_page_Guardian.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/home_Student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/settings_page_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/student_notifications_page.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/student_profile_student.dart';

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
        return MaterialPageRoute(builder: (_) => HomeGuardian());

      case AppRoutes.signup:
        final signupArgs = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => Signup(previosPage: signupArgs),
        );

      case AppRoutes.codeConfirm:
        return MaterialPageRoute(builder: (_) => CodeConfirm());
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => StudentNotificationsPage());

      case AppRoutes.homestudent:
        return MaterialPageRoute(builder: (_) => HomeStudent());
      case AppRoutes.homeguardian:
        return MaterialPageRoute(builder: (_) => HomeGuardian());
      case AppRoutes.studentprofilepage:
        return MaterialPageRoute(builder: (_) => StudentProfilePage());
      case AppRoutes.settingsPage:
        return MaterialPageRoute(builder: (_) => SettingsPageStudent());

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
