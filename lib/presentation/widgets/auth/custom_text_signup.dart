import 'package:flutter/material.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  final String textone;
  final String texttow;
  final void Function()? onTap;
  const CustomTextSignUpOrSignin(
      {super.key, required this.textone, required this.texttow, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(textone, style: Theme.of(context).textTheme.bodyMedium),
        InkWell(
          onTap: onTap,
          child: Text(
            texttow,
            //  style: const TextStyle(color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
