import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/Complaint_student/Complaint_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Complaint_student/complaint_state%20.dart';

class ComplaintPage extends StatelessWidget {
  final int studentId;

  const ComplaintPage({required this.studentId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintCubit(),
      child: Scaffold(
        body: BlocConsumer<ComplaintCubit, ComplaintState>(
          listener: (context, state) {
            if (state is ComplaintSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('تم إرسال الشكوى بنجاح')));
              Navigator.pop(context);
            } else if (state is ComplaintFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<ComplaintCubit>();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  DropdownButtonFormField<String>(
                    value: 'general',
                    items: [
                      DropdownMenuItem(
                        value: 'general',
                        child: Text('مشكلة عامة'),
                      ),
                      DropdownMenuItem(
                        value: 'teacher',
                        child: Text('ضد معلم'),
                      ),
                      DropdownMenuItem(
                        value: 'department',
                        child: Text('ضد قسم'),
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
                      Text('إرسال كمجهول'),
                    ],
                  ),
                  SizedBox(height: 16),
                  state is ComplaintLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                        onPressed: () => cubit.submitComplaint(studentId),
                        child: Text('إرسال الشكوى'),
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
