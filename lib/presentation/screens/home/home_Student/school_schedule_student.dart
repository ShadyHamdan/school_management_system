import 'package:flutter/material.dart';
import 'package:school_management_system/presentation/widgets/home/home_student/school_schedule_student/day_selector%20.dart';
import 'package:school_management_system/presentation/widgets/home/home_student/school_schedule_student/schedule_list.dart';

class SchoolScheduleScreen extends StatelessWidget {
  const SchoolScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(height: 50, child: DaySelector()),
            const SizedBox(height: 10),
            Expanded(child: ClassScheduleList()),
          ],
        ),
      ),
    );
  }
}
