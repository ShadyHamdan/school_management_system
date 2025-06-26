import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/widgets/home/attendance_screen_student/term_attendance_view%20.dart';
import 'package:school_management_system/presentation/widgets/home/attendance_screen_student/weekly_attendance_view.dart';
import 'package:school_management_system/presentation/widgets/home/attendance_screen_student/year_attendance_view%20.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: cyanColor, // لون الخلفية
                child: const SafeArea(
                  bottom: false,
                  child: TabBar(
                    labelColor: Colors.white, // لون النص عند التحديد
                    unselectedLabelColor: Colors.white70, // لون النص غير المحدد
                    indicatorColor: Colors.white, // لون المؤشر
                    tabs: [
                      Tab(text: "الأسبوع"),
                      Tab(text: "الفصل"),
                      Tab(text: "السنة"),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    WeeklyAttendanceView(),
                    TermAttendanceView(),
                    YearAttendanceView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
