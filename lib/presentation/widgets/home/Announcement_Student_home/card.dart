import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/announcement/announcement_Student_state.dart';
import 'package:school_management_system/presentation/cubits/home_student/announcement/announcement_student_cubit.dart';

class CardAnnouncement extends StatelessWidget {
  final dynamic announcement;
  final int index;

  const CardAnnouncement({
    super.key,
    required this.announcement,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementStudentCubit, AnnouncementStudentState>(
      builder: (context, state) {
        final isExpanded = state.expandedIndexes.contains(index);

        return Card(
          color: cyanColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  announcement.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: boldBlueColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  announcement.date,
                  style: TextStyle(fontSize: 14, color: whiteColor),
                ),
                const Divider(height: 20),
                Text(
                  isExpanded
                      ? announcement.content
                      : _getTrimmedContent(announcement.content),
                  style: const TextStyle(fontSize: 16, color: whiteColor),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.read<AnnouncementStudentCubit>().toggleExpanded(
                        index,
                      );
                    },
                    child: Text(
                      isExpanded ? 'عرض أقل' : 'عرض المزيد',
                      style: TextStyle(color: lightBackgroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getTrimmedContent(String content) {
    const maxLength = 100;
    if (content.length <= maxLength) return content;
    return content.substring(0, maxLength) + '...';
  }
}
