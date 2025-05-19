import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/auth/login/login_cubit.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_snack_bar.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_image.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/custom_email_field.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/custom_password_field.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/signup_text_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: boldBlueColor,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 1.1,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  top: 190,
                  child: Container(
                    height: 812,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 50),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginError) {
                            showCustomSnackBar(context, state.error);
                          } else if (state is LoginSuccess) {
                            // Navigate to home screen or perform other actions
                            // Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 160),
                              Text('Email', style: TextStyle(color: greyColor)),
                              CustomEmailField(controller: emailController),
                              SizedBox(height: 35),
                              Text(
                                'Password',
                                style: TextStyle(color: greyColor),
                              ),
                              CustomPasswordField(
                                controller: passwordController,
                              ),
                              SizedBox(height: 40),
                              if (state is LoginLoading)
                                const Center(child: CircularProgressIndicator())
                              else
                                Column(
                                  children: [
                                    CustomButtonAuth(
                                      text: 'SIGN IN',
                                      onPressed: () {
                                        context.read<LoginCubit>().login(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                        );
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: blackColortext,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    SignUpTextButton(),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                AppbarImage(),
                AppbarTitles(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
