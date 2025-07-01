// UI
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/profile/profile_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/profile/profile_state.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/home_Student.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  final _controllers = <String, TextEditingController>{};
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickImage(StudentProfileCubit cubit) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
      cubit.updateStudentImage(image.path);
    }
  }

  Widget buildEditableTile(
    String label,
    String keyName,
    String initialValue,
    void Function(String) onChanged,
  ) {
    _controllers.putIfAbsent(
      keyName,
      () => TextEditingController(text: initialValue),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _controllers[keyName],
        decoration: InputDecoration(labelText: label),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StudentProfileCubit()..fetchStudentProfile(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: boldBlueColor,
          title: Text('ملف الطالب', style: TextStyle(color: whiteColor)),
        ),
        body: BlocBuilder<StudentProfileCubit, StudentProfileState>(
          builder: (context, state) {
            if (state is StudentProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StudentProfileLoaded) {
              final s = state.student;
              final cubit = context.read<StudentProfileCubit>();
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(cubit),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _pickedImage != null
                                ? FileImage(_pickedImage!)
                                : NetworkImage(s.imageUrl) as ImageProvider,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      s.fullName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    buildEditableTile(
                      'الاسم الكامل',
                      'fullName',
                      s.fullName,
                      (v) => cubit.updateStudentField('fullName', v),
                    ),
                    buildEditableTile(
                      'رقم الهاتف',
                      'phone',
                      s.phone,
                      (v) => cubit.updateStudentField('phone', v),
                    ),
                    buildEditableTile(
                      'البريد الإلكتروني',
                      'email',
                      s.email,
                      (v) => cubit.updateStudentField('email', v),
                    ),
                    buildEditableTile(
                      'العنوان',
                      'address',
                      s.address,
                      (v) => cubit.updateStudentField('address', v),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('الرقم الأكاديمي: ${s.studentNumber}'),
                    ),
                    ListTile(title: Text('الصف: ${s.grade}')),
                    ListTile(title: Text('الشعبة: ${s.section}')),
                    ListTile(title: Text('العام الدراسي: ${s.academicYear}')),
                    ListTile(title: Text('الحالة الدراسية: ${s.status}')),
                    ListTile(title: Text('الموجه الأكاديمي: ${s.advisor}')),
                    ListTile(title: Text('المعدل العام: ${s.gpa}')),
                    ListTile(title: Text('الحضور: ${s.attendanceDays} يوم')),
                    ListTile(title: Text('الغياب: ${s.absenceDays} يوم')),
                    ListTile(title: Text('متوسط الدرجات: ${s.averageGrade}%')),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeStudent(),
                          ),
                        );

                        // TODO: إرسال التعديلات إلى API
                      },
                      child: Text('حفظ التعديلات'),
                    ),
                  ],
                ),
              );
            } else if (state is StudentProfileError) {
              return Center(child: Text(state.message));
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
