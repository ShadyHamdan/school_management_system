import 'package:flutter_bloc/flutter_bloc.dart';
import 'attendance_state.dart';
import 'package:school_management_system/data/models/student_home/attendance_student.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceState.initial());

  void loadAttendance() {
    // مثال لبيانات وهمية
    emit(
      state.copyWith(
        weekly: AttendanceModel(
          title: 'الحضور الأسبوعي',
          days: [
            AttendanceDay(date: 'السبت', attended: true),
            AttendanceDay(date: 'الأحد', attended: true),
            AttendanceDay(date: 'الاثنين', attended: false, note: 'مريض'),
            AttendanceDay(date: 'الاثنين', attended: false, note: 'مريض'),
            AttendanceDay(date: 'الاثنين', attended: false, note: 'مريض'),
            AttendanceDay(date: 'الاثنين', attended: false, note: 'إجازة'),

            AttendanceDay(date: 'الاثنين', attended: false, note: 'مريض'),

            // ...
          ],
        ),
        term: AttendanceModel(
          title: 'الحضور الفصلي',
          days: [
            AttendanceDay(date: 'الأسبوع 1', attended: true),
            AttendanceDay(date: 'الأسبوع 2', attended: false),
            // ...
          ],
        ),
        year: AttendanceModel(
          title: 'الحضور السنوي',
          days: [
            AttendanceDay(date: 'الفصل الأول', attended: true),
            AttendanceDay(date: 'الفصل الثاني', attended: false),
            // ...
          ],
        ),
      ),
    );
  }
}
