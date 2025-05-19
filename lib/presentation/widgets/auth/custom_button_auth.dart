import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cyanColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        height: 54,
        onPressed: onPressed,
        textColor: whiteColor,
        child: ListTile(
          title: Text(text, textAlign: TextAlign.center),
          titleTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          trailing: Icon(Icons.arrow_forward, color: whiteColor, size: 25),
        ),
      ),
    );
  }
}
