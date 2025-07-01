import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/Complaint_student/Complaint_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Complaint_student/complaint_state%20.dart';

class ComplaintStudentPage extends StatelessWidget {
  final int studentId;

  const ComplaintStudentPage({required this.studentId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintStudentCubit(),
      child: Scaffold(
        body: BlocConsumer<ComplaintStudentCubit, ComplaintStudentState>(
          listener: (context, state) {
            if (state is ComplaintSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'تم إرسال الشكوى بنجاح',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              );
              Navigator.pop(context);
            } else if (state is ComplaintFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<ComplaintStudentCubit>();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  DropdownButtonFormField<String>(
                    dropdownColor: cyanColor,
                    value: 'general',
                    items: [
                      DropdownMenuItem(
                        value: 'general',
                        child: Text(
                          'مشكلة عامة',
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'teacher',
                        child: Text(
                          'ضد معلم',
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'department',
                        child: Text(
                          'ضد قسم',
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) cubit.setType(value);
                    },
                    decoration: InputDecoration(labelText: 'نوع الشكوى'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'نص الشكوى',
                      focusColor: cyanColor,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: cubit.setContent,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: cubit.anonymous,
                        onChanged: (value) {
                          if (value != null) cubit.setAnonymous(value);
                        },
                      ),
                      Text(
                        'إرسال كمجهول',
                        style: TextStyle(color: boldBlueColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  state is ComplaintLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: boldBlueColor,
                        ),
                        onPressed: () => cubit.submitComplaint(studentId),
                        child: Text(
                          'إرسال الشكوى',
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
