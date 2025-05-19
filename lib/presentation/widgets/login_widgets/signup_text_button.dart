
import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/color.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have account? ',
          style: TextStyle(
            color: blackColortext,
            fontSize: 20,
          ),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Sign UP',
                  style: TextStyle(
                    color: boldBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
