import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 100,
          right: 123,
          top: 10,
        ),
        minWidth: 327,
        height: 56,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        color: orangeColor,
        onPressed: onPressed,
        textColor: whiteNormalColor,
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
