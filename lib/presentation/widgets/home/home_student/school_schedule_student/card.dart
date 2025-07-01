import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/data/models/student_model/schedule.dart';

class ClassCard extends StatelessWidget {
  final int index;
  final ClassPeriod classPeriod;

  const ClassCard({super.key, required this.index, required this.classPeriod});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cyanColor,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: boldBlueColor,
          child: Text("${index + 1}", style: TextStyle(color: whiteColor)),
        ),
        title: Text(
          "📘 ${classPeriod.subject}",
          style: TextStyle(color: whiteColor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("⏰ ${classPeriod.time}", style: TextStyle(color: whiteColor)),
            Text(
              "👨‍🏫 ${classPeriod.teacher}",
              style: TextStyle(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
