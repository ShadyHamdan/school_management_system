// UI: Teacher Evaluation Page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:school_management_system/core/constants/teacher.dart';
import 'package:school_management_system/presentation/cubits/home_student/teacher_evaluation_page_student/evaluation_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/teacher_evaluation_page_student/evaluation_state.dart';

class TeacherEvaluationPage extends StatelessWidget {
  final Teacher teacher;
  const TeacherEvaluationPage({required this.teacher, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeacherEvaluationCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('تقييم المدرس')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<TeacherEvaluationCubit, TeacherEvaluationState>(
            listener: (context, state) {
              if (state is EvaluationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إرسال التقييم بنجاح!')),
                );
                Navigator.pop(context);
              } else if (state is EvaluationFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              final cubit = context.read<TeacherEvaluationCubit>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(teacher.imageUrl),
                    ),
                    title: Text(teacher.name),
                    subtitle: Text(
                      '${teacher.subject} - ${teacher.experience} سنوات خبرة',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('قيّم المدرس:'),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemBuilder:
                        (context, _) => Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: cubit.updateRating,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'ملاحظاتك',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    onChanged: cubit.updateComment,
                  ),
                  SizedBox(height: 20),
                  if (state is EvaluationLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: () => cubit.submitEvaluation(teacher.id),
                      child: Text('إرسال التقييم'),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
