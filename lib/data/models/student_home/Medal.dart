class Medal {
  final String title;
  final String description;
  final String imageUrl;
  final int count; // عدد مرات الحصول على الوسام

  Medal({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.count,
  });

  factory Medal.fromJson(Map<String, dynamic> json) {
    return Medal(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      count: json['count'] ?? 1,
    );
  }
}
