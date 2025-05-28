
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key, required this.locale});

  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(
            context,
          ).pushNamed(AppRoutes.signup, arguments: 'forgetpassword');
        },
        child: Text(
          locale.forgot_password,
          style: TextStyle(color: blackColortext, fontSize: 16.sp),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
