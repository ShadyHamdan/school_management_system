import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/constants/image_asset.dart';
import 'package:school_management_system/core/function/list.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerItems = getDrawerItems(context);

    return Drawer(
      shadowColor: whiteColor,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: cyanColor,
              image: DecorationImage(
                image: AssetImage(APPImageAsset.splashScreen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text(
                  'قائمة الطالب',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Column(
                children: List.generate(drawerItems.length, (index) {
                  final item = drawerItems[index];
                  return ListTile(
                    leading: Icon(item['icon'], color: Colors.white),
                    title: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: item['onTap'],
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
