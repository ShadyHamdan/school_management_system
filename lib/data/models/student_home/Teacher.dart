// models/teacher_model.dart
class Teacher {
  final int id;
  final String name;
  final String subject;
  double? rating;

  Teacher({
    required this.id,
    required this.name,
    required this.subject,
    this.rating,
  });
}
