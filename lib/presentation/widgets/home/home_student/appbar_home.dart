import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_state.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final List<String> tabs;

  const CustomAppBar({
    super.key,
    this.onPressed1,
    this.onPressed2,
    this.onTap1,
    this.onTap2,
    required this.tabs,
  });

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
              onPressed: onPressed1,
            ),
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white, // لون الخلفية
            shape: BoxShape.circle, // شكل دائري
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // لون الظل
                blurRadius: 6, // درجة تموج الظل
                spreadRadius: 1, // انتشار الظل
                offset: Offset(0, 3), // اتجاه الظل (أسفل)
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_none_sharp), // الأيقونة
            iconSize: 20, // حجم الأيقونة
            color: boldBlueColor, // لون الأيقونة
            onPressed: onPressed2,
            padding: EdgeInsets.zero, // إزالة الحشو الداخلي
          ),
        ),

        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          shadowColor: boldBlueColor,
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: boldBlueColor,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(Icons.more_vert, color: boldBlueColor),
          ),
          itemBuilder:
              (context) => [
                PopupMenuItem(
                  value: 'settings',
                  onTap: onTap1,
                  child: Text('الإعدادات'),
                ),
                PopupMenuItem(
                  value: 'profile',
                  onTap: onTap2,
                  child: Text('Profile'),
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
