import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/student_model/attendance_student.dart';

class AttendanceState extends Equatable {
  final AttendanceModel? weekly;
  final AttendanceModel? term;
  final AttendanceModel? year;

  const AttendanceState({this.weekly, this.term, this.year});

  factory AttendanceState.initial() => AttendanceState();

  AttendanceState copyWith({
    AttendanceModel? weekly,
    AttendanceModel? term,
    AttendanceModel? year,
  }) {
    return AttendanceState(
      weekly: weekly ?? this.weekly,
      term: term ?? this.term,
      year: year ?? this.year,
    );
  }

  @override
  List<Object?> get props => [weekly, term, year];
}
