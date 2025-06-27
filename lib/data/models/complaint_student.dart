class Complaint {
  final String type; // 'teacher', 'department', 'general'
  final String content;
  final bool isAnonymous;

  Complaint({
    required this.type,
    required this.content,
    required this.isAnonymous,
  });

  Map<String, dynamic> toJson() => {
    'type': type,
    'content': content,
    'anonymous': isAnonymous,
  };
}
