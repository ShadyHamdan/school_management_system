import 'package:flutter/material.dart';
import 'package:school_management_system/presentation/widgets/home/attendance_screen_student/term_attendance_view%20.dart';
import 'package:school_management_system/presentation/widgets/home/attendance_screen_student/weekly_attendance_view.dart';
import 'package:school_management_system/presentation/widgets/home/attendance_screen_student/year_attendance_view%20.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "الأسبوع"),
              Tab(text: "الفصل"),
              Tab(text: "السنة"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WeeklyAttendanceView(),
            TermAttendanceView(),
            YearAttendanceView(),
          ],
        ),
      ),
    );
  }
}
