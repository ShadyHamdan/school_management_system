import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:school_management_system/core/constants/color.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<TeacherEvaluationCubit, TeacherEvaluationState>(
            listener: (context, state) {
              if (state is EvaluationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إرسال التقييم بنجاح!')),
                );
                Navigator.pop(context); // الرجوع للصفحة السابقة بعد النجاح
              } else if (state is EvaluationFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              final cubit = context.read<TeacherEvaluationCubit>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // معلومات المدرس
                  Card(
                    color: boldBlueColor,
                    child: ListTile(
                      textColor: whiteColor,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(teacher.imageUrl),
                      ),
                      title: Text(teacher.name),
                      subtitle: Text(
                        '${teacher.subject} - ${teacher.experience} سنوات خبرة',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('قيّم المدرس', style: TextStyle(fontSize: 18)),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
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
                  state is EvaluationLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: whiteColor,
                          backgroundColor: boldBlueColor, // لون النص
                        ),
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

Future<List<Teacher>> fetchTeachers() async {
  final response = await http.get(
    Uri.parse('https://example.com/api/teachers'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Teacher.fromJson(json)).toList();
  } else {
    throw Exception('فشل في جلب بيانات المدرسين');
  }
}
