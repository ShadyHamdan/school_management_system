class StudentNote {
  final String title;
  final String message;
  final DateTime date;

  StudentNote({required this.title, required this.message, required this.date});
}


/*
class StudentNote {
  final String title;
  final String message;

  StudentNote({required this.title, required this.message});

  Map<String, dynamic> toJson() {
    return {'title': title, 'message': message};
  }
}
*/