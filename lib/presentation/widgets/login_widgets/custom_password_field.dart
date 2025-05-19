import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/auth/login/login_cubit.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const CustomPasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final obscureText = state.obscurePassword;  
        return Container(
          alignment: Alignment.center,
          width: 335,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(color: darkBlueGrayColor, fontSize: 16),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<LoginCubit>().togglePasswordVisibility();
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
