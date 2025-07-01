import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/function/list.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_state.dart';
import 'package:school_management_system/presentation/screens/home/student_notifications_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 3.6;
    return AppBar(
      elevation: 0,
      backgroundColor: boldBlueColor,
      centerTitle: true,
      leading: Builder(
        builder:
            (context) => IconButton(
              color: whiteColor,
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),
      actions: [
        IconButton(
          color: whiteColor,
          icon: const Icon(Icons.notifications_none_sharp),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentNotificationsPage(),
              ),
            );
          },
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert),
          color: cyanColor,
          iconColor: whiteColor,
          shadowColor: whiteColor,
          onSelected: (value) {
            // التعامل مع الخيارات
          },
          itemBuilder:
              (context) => [
                PopupMenuItem(
                  value: 'settings',
                  child: Text('settings', style: TextStyle(color: whiteColor)),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/SettingsPage',
                      (route) => false,
                    );
                  },
                ),
                PopupMenuItem(
                  value: 'profile',
                  child: Text('profile ', style: TextStyle(color: whiteColor)),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/StudentProfilePage',
                      (route) => false,
                    );
                  },
                ),
              ],
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: boldBlueColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SingleChildScrollView(
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<TabCubit, TabState>(
              builder: (context, selectedIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(tabs.length, (index) {
                    final isSelected = index == selectedIndex.selectedIndex;
                    return GestureDetector(
                      onTap: () => context.read<TabCubit>().changeTab(index),
                      child: Container(
                        width: itemWidth,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? cyanColor : boldBlueColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              color: isSelected ? whiteColor : whiteColor,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
