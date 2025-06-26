import 'package:flutter/material.dart';
import 'package:school_management_system/core/function/list.dart';
import 'package:school_management_system/presentation/widgets/home/Announcement_Student_home/card.dart';

class Announcement {
  final String title;
  final String date;
  final String content;

  Announcement({
    required this.title,
    required this.date,
    required this.content,
  });
}

class AnnouncementStudent extends StatelessWidget {
  const AnnouncementStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return CustomCardAnnouncement(
            announcement: announcement,
            index: index,
          );
        },
      ),
    );
  }
}
