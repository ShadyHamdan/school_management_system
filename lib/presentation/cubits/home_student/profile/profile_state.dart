// Student Profile States
import 'package:school_management_system/data/models/student_home/student_profile.dart';

abstract class StudentProfileState {}

class StudentProfileInitial extends StudentProfileState {}

class StudentProfileLoading extends StudentProfileState {}

class StudentProfileLoaded extends StudentProfileState {
  final Student student;
  StudentProfileLoaded(this.student);
}

class StudentProfileError extends StudentProfileState {
  final String message;
  StudentProfileError(this.message);
}
