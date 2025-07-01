// UI: Teachers List Page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/teacher_evaluation_page_student/teacher_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/teacher_evaluation_page_student/teacher_state.dart';
import 'package:school_management_system/presentation/screens/home/teacher_evaluation_page_student.dart';

class TeachersListPage extends StatelessWidget {
  const TeachersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeachersCubit()..fetchTeachers(),
      child: Scaffold(
        body: BlocBuilder<TeachersCubit, TeachersState>(
          builder: (context, state) {
            if (state is TeachersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TeachersError) {
              return Center(child: Text(state.message));
            } else if (state is TeachersLoaded) {
              final teachers = state.teachers;
              return ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  final teacher = teachers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(teacher.imageUrl),
                    ),
                    title: Text(teacher.name),
                    subtitle: Text(teacher.subject),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => TeacherEvaluationPage(teacher: teacher),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
