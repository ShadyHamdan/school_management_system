class TripModel {
  final String title;
  final String description;
  final String date;
  final bool isJoined;
  final bool isExpanded;

  TripModel({
    required this.title,
    required this.description,
    required this.date,
    this.isJoined = false,
    this.isExpanded = false,
  });

  TripModel copyWith({bool? isJoined, bool? isExpanded}) {
    return TripModel(
      title: title,
      description: description,
      date: date,
      isJoined: isJoined ?? this.isJoined,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

/*
class Trip {
  final int id;
  final String title;
  final String description;
  final String date;
  bool joined;

  Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.joined = false,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      joined: json['joined'] ?? false,
    );
  }
}
*/
