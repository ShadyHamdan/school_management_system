// Required imports

// Student Model
class Student {
  String fullName;
  String studentNumber;
  String birthDate;
  String gender;
  String imageUrl;
  String phone;
  String email;
  String address;
  String grade;
  String section;
  String academicYear;
  String status;
  String advisor;
  double gpa;
  int attendanceDays;
  int absenceDays;
  double averageGrade;

  Student({
    required this.fullName,
    required this.studentNumber,
    required this.birthDate,
    required this.gender,
    required this.imageUrl,
    required this.phone,
    required this.email,
    required this.address,
    required this.grade,
    required this.section,
    required this.academicYear,
    required this.status,
    required this.advisor,
    required this.gpa,
    required this.attendanceDays,
    required this.absenceDays,
    required this.averageGrade,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    fullName: json['full_name'],
    studentNumber: json['student_number'],
    birthDate: json['birth_date'],
    gender: json['gender'],
    imageUrl: json['image_url'],
    phone: json['phone'],
    email: json['email'],
    address: json['address'],
    grade: json['grade'],
    section: json['section'],
    academicYear: json['academic_year'],
    status: json['status'],
    advisor: json['advisor'],
    gpa: json['gpa'].toDouble(),
    attendanceDays: json['attendance_days'],
    absenceDays: json['absence_days'],
    averageGrade: json['average_grade'].toDouble(),
  );
}
