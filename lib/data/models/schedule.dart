class ClassPeriod {
  final String subject;
  final String time;
  final String teacher;

  ClassPeriod({
    required this.subject,
    required this.time,
    required this.teacher,
  });
}
/*
وقت الربط

  factory ClassPeriod.fromJson(Map<String, dynamic> json) {
    return ClassPeriod(
      subject: json['subject'],
      time: json['time'],
      teacher: json['teacher'],
    );
  }
}
*/
