// Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/student_model/student_profile.dart';
import 'package:school_management_system/presentation/cubits/home_student/profile/profile_state.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit() : super(StudentProfileInitial());

  Future<void> fetchStudentProfile() async {
    emit(StudentProfileLoading());

    try {
      final student = Student(
        fullName: 'رafat alshofi',
        studentNumber: '20230015',
        birthDate: '2005-04-12',
        gender: 'ذكر',
        imageUrl: 'https://i.pravatar.cc/150?img=3',
        phone: '0991234567',
        email: 'rafat@example.com',
        address: 'دمشق - المزة',
        grade: 'الثاني الثانوي',
        section: 'أ',
        academicYear: '2024/2025',
        status: 'منتظم',
        advisor: 'أ. محمد عبدو',
        gpa: 3.7,
        attendanceDays: 145,
        absenceDays: 5,
        averageGrade: 89.5,
      );

      emit(StudentProfileLoaded(student));
    } catch (e) {
      emit(StudentProfileError("فشل تحميل البيانات"));
    }
  }

  void updateStudentField(String field, String value) {
    if (state is StudentProfileLoaded) {
      final student = (state as StudentProfileLoaded).student;
      switch (field) {
        case 'fullName':
          student.fullName = value;
          break;
        case 'phone':
          student.phone = value;
          break;
        case 'email':
          student.email = value;
          break;
        case 'address':
          student.address = value;
          break;
      }
      emit(StudentProfileLoaded(student));
    }
  }

  void updateStudentImage(String imagePath) {
    if (state is StudentProfileLoaded) {
      final student = (state as StudentProfileLoaded).student;
      student.imageUrl = imagePath;
      emit(StudentProfileLoaded(student));
    }
  }
}
