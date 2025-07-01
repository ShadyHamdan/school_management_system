import 'package:flutter/material.dart';
import 'package:school_management_system/data/models/student_model/schedule.dart';
import 'package:school_management_system/presentation/screens/home/announcement_Student.dart';
import 'package:school_management_system/presentation/screens/home/home_Guardian/Performance_page.dart';
import 'package:school_management_system/presentation/screens/home/home_Guardian/bus_tracking_page_guardian.dart';
import 'package:school_management_system/presentation/screens/home/home_Guardian/complaint_page_guardian.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/attendance_screen_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/complaint_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/medals_page_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/note_view_Student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/school_schedule_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/school_trips_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/settings_page_student.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/student_exam_results_student%20.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/student_notifications_page.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/teachers_list_page_student.dart';

//student
final List<String> tabsStudent = [
  "الاعلانات",
  "البرنامج",
  "الحضور",
  "النتائج",
  "الملاحظات",

  "تقييم",
  "الرحلات",
  "الأوسمة والجوائز",
  "شكوى",
];

final List<Widget> pagesStudent = [
  AnnouncementStudent(),
  SchoolScheduleScreen(),
  AttendanceScreen(),
  ExamResultsScreen(),
  AddStudentNoteScreen(),
  TeachersListPage(),
  TripsScreen(),
  MedalsPage(studentId: 4),
  ComplaintStudentPage(studentId: 3),
];
List<Map<String, dynamic>> getDrawerItemsStudent(BuildContext context) => [
  {
    'icon': Icons.person,
    'title': 'الملف الشخصي',
    'onTap': () {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil('/StudentProfilePage', (route) => false);
    },
  },
  {
    'icon': Icons.settings,
    'title': 'الإعدادات',
    'onTap': () async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPageStudent()),
      );
    },
  },
  {
    'icon': Icons.logout,
    'title': 'تسجيل الخروج',
    'onTap': () {
      // تنفيذ أمر تسجيل الخروج
      Navigator.of(context).pushNamedAndRemoveUntil('/Login', (route) => false);
    },
  },

  {
    'icon': Icons.notifications,
    'title': 'الإشعارات',
    'onTap': () async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentNotificationsPage()),
      );
    },
  },
];

final List<Announcement> announcements = [
  Announcement(
    title: 'امتحان منتصف الفصل',
    date: '20 مايو 2025',
    content:
        'سيُعقد امتحان منتصف الفصل في الأسبوع القادم لجميع الصفوف، يرجى التحضير.',
  ),
  Announcement(
    title: 'رحلة مدرسية',
    date: '15 مايو 2025',
    content:
        'ستنظم المدرسة رحلة إلى المتحف الوطني، الرجاء تسجيل الأسماء قبل يوم الخميس.ستنظم المدرسة رحلة إلى المتحف الوطني، الرجاء تسجيل الأسماء قبل يوم الخميسستنظم المدرسة رحلة إلى المتحف الوطني، الرجاء تسجيل الأسماء قبل يوم الخميس',
  ),
  Announcement(
    title: 'صيانة في المدرسة',
    date: '10 مايو 2025',
    content:
        'ستتم بعض أعمال الصيانة في الطابق الثاني، الرجاء عدم التواجد في المنطقة المحددة.',
  ),
];
Map<String, List<ClassPeriod>> schedule = {
  "السبت": [
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "علوم", time: "8:50 - 9:35", teacher: "أ. سارة"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    // ...
  ],
  "الأحد": [
    ClassPeriod(subject: "لغة عربية", time: "8:00 - 8:45", teacher: "أ. خالد"),
    ClassPeriod(subject: "اجتماعيات", time: "8:50 - 9:35", teacher: "أ. ليلى"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
  ],
  "الإثنين": [
    ClassPeriod(subject: "لغة عربية", time: "8:00 - 8:45", teacher: "أ. خالد"),
    ClassPeriod(subject: "اجتماعيات", time: "8:50 - 9:35", teacher: "أ. ليلى"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
  ],
  "الثلاثاء": [
    ClassPeriod(subject: "لغة عربية", time: "8:00 - 8:45", teacher: "أ. خالد"),
    ClassPeriod(subject: "اجتماعيات", time: "8:50 - 9:35", teacher: "أ. ليلى"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
  ],
  "الأربعاء": [
    ClassPeriod(subject: "لغة عربية", time: "8:00 - 8:45", teacher: "أ. خالد"),
    ClassPeriod(subject: "اجتماعيات", time: "8:50 - 9:35", teacher: "أ. ليلى"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
  ],
  "الخميس": [
    ClassPeriod(subject: "لغة عربية", time: "8:00 - 8:45", teacher: "أ. خالد"),
    ClassPeriod(subject: "اجتماعيات", time: "8:50 - 9:35", teacher: "أ. ليلى"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
  ],
  "الجمعة": [
    ClassPeriod(subject: "لغة عربية", time: "8:00 - 8:45", teacher: "أ. خالد"),
    ClassPeriod(subject: "اجتماعيات", time: "8:50 - 9:35", teacher: "أ. ليلى"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
    ClassPeriod(subject: "رياضيات", time: "8:00 - 8:45", teacher: "أ. أحمد"),
  ],
  // بقية الأيام
};
//guardian
final List<String> tabsGuardian = [
  "الاعلانات",
  "البرنامج",
  "الحضور وتبرير الغياب",
  "النتائج",
  "تتبع الرحلات",
  "شكوى",
];
final List<Widget> pagesGuardian = [
  AnnouncementStudent(),
  SchoolScheduleScreen(),
  PerformancePage(studentId: 1, parentId: 1),
  AttendanceScreen(),
  BusTrackingPage(parentId: 1),
  ComplaintGuardianPage(guardiantId: 1),
];
List<Map<String, dynamic>> getDrawerItemsGuardian(BuildContext context) => [
  {
    'icon': Icons.person,
    'title': 'الملف الشخصي',
    'onTap': () {
      // Navigator.of(
      //   context,
      // ).pushNamedAndRemoveUntil('/GuardianProfilePage', (route) => false);
    },
  },
  {
    'icon': Icons.settings,
    'title': 'الإعدادات',
    'onTap': () async {
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SettingsPageGuardian()),
      // );
    },
  },
  {
    'icon': Icons.logout,
    'title': 'تسجيل الخروج',
    'onTap': () {
      // تنفيذ أمر تسجيل الخروج
      Navigator.of(context).pushNamedAndRemoveUntil('/Login', (route) => false);
    },
  },

  {
    'icon': Icons.notifications,
    'title': 'الإشعارات',
    'onTap': () async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentNotificationsPage()),
      );
    },
  },
];
