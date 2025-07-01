import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/constants/image_asset.dart';

class DrawerHome extends StatelessWidget {
  final String name;
  final List<Map<String, dynamic>> drawerItems;
  const DrawerHome({super.key, required this.name, required this.drawerItems});

  @override
  Widget build(BuildContext context) {
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
              DrawerHeader(
                child: Text(
                  name,
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
