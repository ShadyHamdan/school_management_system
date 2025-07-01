import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/attendance_student/attendance_state.dart';

class WeeklyAttendanceView extends StatelessWidget {
  const WeeklyAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        final weekly = state.weekly;

        if (weekly == null) {
          // إذا لم يتم تحميل البيانات بعد
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<AttendanceCubit>().loadAttendance();
                  },
                  child: const Text('تحميل بيانات الحضور'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: weekly.days.length,
          itemBuilder: (context, index) {
            final day = weekly.days[index];
            final color = day.attended ? Colors.green : Colors.red;

            return Card(
              color: cyanColor,
              child: ListTile(
                title: Text(
                  day.date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle:
                    !day.attended && day.note != null
                        ? Text(
                          "ملاحظة: ${day.note!}",
                          style: TextStyle(color: boldBlueColor),
                        )
                        : null,
                trailing: Icon(
                  day.attended ? Icons.check_circle : Icons.cancel,
                  color: color,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
