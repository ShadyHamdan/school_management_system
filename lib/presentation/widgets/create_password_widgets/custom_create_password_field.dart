import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/auth/create_password/create_password_cubit.dart';

class CustomCreatePasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final String fieldId;
  const CustomCreatePasswordField({
    super.key,
    required this.controller,
    required this.obscurePassword, required this.fieldId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePasswordCubit, CreatePasswordState>(
      builder: (context, state) {
        final obscureText = obscurePassword;
        return Container(
          alignment: Alignment.center,
          width: 335.w,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(color: darkBlueGrayColor, fontSize: 16.sp),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  context
                      .read<CreatePasswordCubit>()
                      .togglePasswordVisibility(fieldId: fieldId);
                },
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: greyColor,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
