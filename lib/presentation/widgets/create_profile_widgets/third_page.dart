import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/auth/create_profile/create_profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Column thirdPage(CreateProfileState state, BuildContext context) {
  final locale = AppLocalizations.of(context)!;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 160.h),
      Text(
        locale.gender,
        style: TextStyle(
          color: greyColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 14.h),
      Row(
        children: [
          Expanded(
            child: RadioListTile(
              title: Text(
                locale.male,
                style: TextStyle(color: blackColortext, fontSize: 15.sp),
              ),
              value: 'Male',
              groupValue: state.gender,
              onChanged: (value) {
                context.read<CreateProfileCubit>().updateGender(value!);
              },
            ),
          ),
          Expanded(
            child: RadioListTile(
              title: Text(
                locale.female,
                style: TextStyle(fontSize: 15.sp, color: blackColortext),
              ),
              value: 'Female',
              groupValue: state.gender,
              onChanged: (value) {
                context.read<CreateProfileCubit>().updateGender(value!);
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 14.h),

      Text(
        locale.attribute,
        style: TextStyle(
          color: greyColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            width: 200.w,
            child: Column(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      locale.student,

                      style: TextStyle(color: blackColortext, fontSize: 15.sp),
                    ),
                    value: 'Student',
                    groupValue: state.attribute,
                    onChanged: (value) {
                      context.read<CreateProfileCubit>().updateAttribute(
                        value!,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      locale.teacher,
                      style: TextStyle(color: blackColortext, fontSize: 15.sp),
                    ),
                    value: 'Teacher',
                    groupValue: state.attribute,
                    onChanged: (value) {
                      context.read<CreateProfileCubit>().updateAttribute(
                        value!,
                      );
                    },
                  ),
                ),

                Expanded(
                  child: RadioListTile(
                    title: Text(
                      locale.guardian,
                      style: TextStyle(color: blackColortext, fontSize: 15.sp),
                    ),
                    value: 'Guardian',
                    groupValue: state.attribute,
                    onChanged: (value) {
                      context.read<CreateProfileCubit>().updateAttribute(
                        value!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
