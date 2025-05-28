import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/function/list.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_schedule/SchoolSchedule_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_schedule/SchoolSchedule_state.dart';
import 'package:school_management_system/presentation/widgets/home/school_schedule_student/card.dart';

class ClassScheduleList extends StatelessWidget {
  const ClassScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        final selectedDay = state.selectedDay;
        final dayClasses = schedule[selectedDay]!;

        return ListView.builder(
          itemCount: dayClasses.length,
          itemBuilder: (context, index) {
            final classPeriod = dayClasses[index];
            return ClassCard(index: index, classPeriod: classPeriod);
          },
        );
      },
    );
  }
}
