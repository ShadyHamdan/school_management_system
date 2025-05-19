import 'package:flutter/material.dart';

Widget buildCard(String title, IconData icon) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 8),
        Center(child: Text(title, style: const TextStyle(fontSize: 16))),
      ],
    ),
  );
}
