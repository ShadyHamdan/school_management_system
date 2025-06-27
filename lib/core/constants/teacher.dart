class Teacher {
  final int id;
  final String name;
  final String subject;
  final String imageUrl;
  final int experience;

  Teacher({
    required this.id,
    required this.name,
    required this.subject,
    required this.imageUrl,
    required this.experience,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      subject: json['subject'],
      imageUrl: json['imageUrl'],
      experience: json['experience'],
    );
  }
}
