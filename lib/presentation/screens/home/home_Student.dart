import 'package:flutter/material.dart';
import 'package:school_management_system/presentation/widgets/home/appbar_home.dart';
import 'package:school_management_system/presentation/widgets/home/buildCard_home.dart';

class HomeStudent extends StatelessWidget {
  const HomeStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        studentName: 'alshofi',
        announcements: [
          "امتحان رياضيات غدًا في الساعة 9:00",
          "تسليم مشاريع البرمجة الأسبوع القادم",
          "حفل التخرج يوم الخميس القادم",
          "جلسة توجيهية للطلاب الجدد يوم الإثنين",
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'قائمة الطالب',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('الصفحة الرئيسية'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الإعدادات'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('تسجيل الخروج'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: [
            buildCard('عرض البرنامج', Icons.calendar_today),
            buildCard('نسبة الحضور والغياب', Icons.check_circle_outline),
            buildCard('المعدل السنوي والعلامات', Icons.school),
            buildCard('عرض الأوسمة والجوائز', Icons.emoji_events),
            buildCard('تقديم شكوى', Icons.feedback),
            buildCard('مواعيد الرحلات الخاصة', Icons.flight),
            buildCard('تقييم نهاية السنة', Icons.rate_review),
            buildCard('التذكير بالوظائف والاختبارات', Icons.alarm),
          ],
        ),
      ),
    );
  }
}
