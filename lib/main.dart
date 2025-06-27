import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/code_confirm/code_confirm_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/create_password/create_password_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/create_profile/create_profile_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/login/login_cubit.dart';

import 'package:school_management_system/presentation/cubits/auth/signup/signup_cubit.dart';

import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/announcement/announcement_student_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/exam_results/exam_results_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/notes_student/student_notes_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_schedule/SchoolSchedule_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_trips/trip_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/routes/route_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    BlocProvider(
      create: (context) => PreferencesCubit(prefs),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => CodeConfirmCubit()),
        BlocProvider(create: (context) => CreatePasswordCubit()),
        BlocProvider(create: (context) => CreateProfileCubit()),
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => AnnouncementStudentCubit()),
        BlocProvider(create: (context) => ScheduleCubit()),
        BlocProvider(create: (context) => AttendanceCubit()..loadAttendance()),
        BlocProvider(create: (context) => ExamResultsCubit()..loadResults()),
        BlocProvider(create: (context) => StudentNotesCubit()),
        BlocProvider(create: (context) => TripCubit()..loadTrips()),
      ],
      child: Builder(
        builder:
            (context) => BlocBuilder<PreferencesCubit, PreferencesState>(
              buildWhen: (prev, current) => prev.locale != current.locale,
              builder: (context, state) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple,
                    ),
                  ),

                  locale: state.locale,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  initialRoute: AppRoutes.splashScreen,
                  onGenerateRoute: RouteGenerator.generateRoute,
                );
              },
            ),
      ),
    );
  }
}
