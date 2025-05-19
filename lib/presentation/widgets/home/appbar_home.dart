import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> announcements;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.announcements,
    required String studentName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 6.0,
      backgroundColor: boldBlueColor,
      shadowColor: Colors.black45,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, boldBlueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  announcements
                      .map(
                        (announcement) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: cyanColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            announcement,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: boldBlueColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'الإشعارات',
          onPressed: () {
            // فتح صفحة الإشعارات
          },
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            // التعامل مع الخيارات
          },
          itemBuilder:
              (context) => [
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('الإعدادات'),
                ),
                const PopupMenuItem(
                  value: 'profile',
                  child: Text('الملف الشخصي'),
                ),
              ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130.0);
}
