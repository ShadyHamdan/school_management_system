import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_state.dart';

class YearAttendanceView extends StatelessWidget {
  const YearAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        final year = state.year;

        if (year == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: year.days.length,
          itemBuilder: (context, index) {
            final term = year.days[index];

            final attendedDays = term.attended ? 1 : 0;
            const totalDays = 1; // يمكن تعديلها عند توفر بيانات أكثر دقة
            final rate = (attendedDays / totalDays) * 100;

            return Card(
              color: cyanColor,
              child: ListTile(
                title: Text(
                  term.date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
                subtitle: Text(
                  "الحضور: $attendedDays/$totalDays (${rate.toStringAsFixed(1)}%)",
                  style: TextStyle(color: boldBlueColor),
                ),
                trailing: Icon(
                  rate >= 75 ? Icons.check : Icons.error,
                  color: rate >= 75 ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
