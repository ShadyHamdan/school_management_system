import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/function/list.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_state.dart';
import 'package:school_management_system/presentation/widgets/home/home_student/Drawer_home.dart';
import 'package:school_management_system/presentation/widgets/home/home_student/appbar_home.dart';

class HomeGuardian extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

  HomeGuardian({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerItems = getDrawerItemsGuardian(context);

    return Scaffold(
      key: _scaffoldKey2,
      appBar: CustomAppBar(
        onPressed1: () => _scaffoldKey2.currentState?.openDrawer(),
        onPressed2: () {},
        onTap1: () {},
        onTap2: () {},
        tabs: tabsGuardian,
      ),
      drawer: DrawerHome(name: 'قائمة ولي الامر', drawerItems: drawerItems),
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return pagesGuardian[state.selectedIndex];
        },
      ),
    );
  }
}
