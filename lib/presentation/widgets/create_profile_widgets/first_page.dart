import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/custom_email_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Column firstPage(
  TextEditingController nameController,
  TextEditingController phoneNumberController,
  BuildContext context,
) {
  final locale = AppLocalizations.of(context)!;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 160.h),
      Text(
        locale.fullName,
        style: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
      ),
      CustomEmailField(
        controller: nameController,
        hintText: locale.firstNameAndLastName,
      ),
      SizedBox(height: 35.h),
      Text(
        locale.phonenumber,
        style: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
      ),
      CustomEmailField(
        keyboardType: TextInputType.phone,
        controller: phoneNumberController,
        hintText: '09XX XXX XXX',
      ),

      // if (state is CreateProfileLoading)
      //   const Center(child: CircularProgressIndicator())
      // else
    ],
  );
}
