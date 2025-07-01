import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_state.dart';

class TermAttendanceView extends StatelessWidget {
  const TermAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        final term = state.term;

        if (term == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: term.days.length,
          itemBuilder: (context, index) {
            final day = term.days[index];

            final attendedDays = day.attended ? 1 : 0;
            const totalDays = 1; // لأن كل إدخال يمثل أسبوعًا واحدًا
            final attendanceRate = (attendedDays / totalDays) * 100;

            return Card(
              color: cyanColor,
              child: ListTile(
                title: Text(
                  day.date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
                subtitle: Text(
                  "الحضور: $attendedDays/$totalDays (${attendanceRate.toStringAsFixed(1)}%)",
                  style: TextStyle(color: boldBlueColor),
                ),
                trailing: Icon(
                  attendanceRate >= 75
                      ? Icons.check_circle
                      : Icons.warning_amber_rounded,
                  color: attendanceRate >= 75 ? Colors.green : Colors.orange,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
