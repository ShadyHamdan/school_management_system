import 'package:flutter/material.dart';
import 'package:school_management_system/data/models/schedule.dart';
import 'package:school_management_system/presentation/screens/home/announcement_student.dart';
import 'package:school_management_system/presentation/screens/home/attendance_screen_student.dart';
import 'package:school_management_system/presentation/screens/home/school_schedule_student.dart';
import 'package:school_management_system/presentation/screens/home/student_exam_results_student%20.dart';

final List<String> tabs = [
  "الاعلانات",
  "البرنامج",
  "الحضور",
  "النتائج",
  "الملاحظات",
  "المعدل",
  "تقييم",
  "الرحلات",
  "الأوسمة والجوائز",
  "شكوى",
];
final List<Widget> pages = [
  AnnouncementStudent(),
  SchoolScheduleScreen(),
  AttendanceScreen(),
  ExamResultsScreen(),
  Center(child: Text("صفحة الملاحظات", style: TextStyle(fontSize: 24))),
  Center(child: Text("صفحة المعدل", style: TextStyle(fontSize: 24))),
  Center(child: Text("صفحة تقييم", style: TextStyle(fontSize: 24))),
  Center(child: Text("صفحة الرحلات", style: TextStyle(fontSize: 24))),
  Center(child: Text("الأوسمة والجوائز", style: TextStyle(fontSize: 24))),
  Center(child: Text("شكوى ", style: TextStyle(fontSize: 24))),
];
final List<Map<String, dynamic>> drawerItems = [
  {
    'icon': Icons.home,
    'title': 'الصفحة الرئيسية',
    'onTap': () {
      // تنفيذ أمر الصفحة الرئيسية
    },
  },
  {
    'icon': Icons.settings,
    'title': 'الإعدادات',
    'onTap': () {
      // تنفيذ أمر الإعدادات
    },
  },
  {
    'icon': Icons.logout,
    'title': 'تسجيل الخروج',
    'onTap': () {
      // تنفيذ أمر تسجيل الخروج
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
