import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/auth/login/login_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/announcement/announcement_student_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/exam_results/exam_results_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_schedule/SchoolSchedule_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => AnnouncementStudentCubit()),
        BlocProvider(create: (context) => ScheduleCubit()),
        BlocProvider(create: (context) => AttendanceCubit()..loadAttendance()),
        BlocProvider(create: (context) => ExamResultsCubit()..loadResults()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
