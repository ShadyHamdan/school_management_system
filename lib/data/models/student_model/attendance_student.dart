enum AttendanceViewType { week, term, year }

class AttendanceDay {
  final String date;
  final bool attended;
  final String? note;

  AttendanceDay({required this.date, required this.attended, this.note});
}

class AttendanceModel {
  final List<AttendanceDay> days;
  final String title;
  AttendanceModel({required this.title, required this.days});
}
