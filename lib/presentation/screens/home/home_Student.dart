import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/function/list.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_state.dart';
import 'package:school_management_system/presentation/widgets/home/Drawer_home.dart';
import 'package:school_management_system/presentation/widgets/home/appbar_home.dart';

class HomeStudent extends StatelessWidget {
  const HomeStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerHome(),
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return pages[state.selectedIndex];
        },
      ),
    );
  }
}
