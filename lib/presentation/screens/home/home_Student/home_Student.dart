import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/function/list.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_state.dart';
import 'package:school_management_system/presentation/screens/home/home_Student/student_notifications_page.dart';
import 'package:school_management_system/presentation/widgets/home/home_student/Drawer_home.dart';
import 'package:school_management_system/presentation/widgets/home/home_student/appbar_home.dart';

class HomeStudent extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerItems2 = getDrawerItemsStudent(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onPressed1: () => _scaffoldKey.currentState?.openDrawer(),
        onPressed2:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentNotificationsPage(),
              ),
            ),
        onTap1:
            () => Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/SettingsPage', (route) => false),
        onTap2:
            () => Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/StudentProfilePage', (route) => false),
        tabs: tabsStudent,
      ),
      drawer: DrawerHome(name: 'قائمة الطالب', drawerItems: drawerItems2),
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return pagesStudent[state.selectedIndex];
        },
      ),
    );
  }
}
