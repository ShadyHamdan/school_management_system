import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/auth/login/login_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/widgets/auth/change_language_button.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_snack_bar.dart';
import 'package:school_management_system/presentation/widgets/auth/forgot_password_text.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_image.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/custom_email_field.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/custom_password_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/signup_text_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final locale = AppLocalizations.of(context)!;
    LoginState? previousState;
    return Scaffold(
      backgroundColor: boldBlueColor,
      body: ListView(
        children: [
          SizedBox(
            height: 850.h,
            width: 375.w,
            child: Stack(
              children: [
                Positioned(
                  top: 210.h,
                  child: Container(
                    height: 812.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.sp),
                        topRight: Radius.circular(35.sp),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 50.w),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginError &&
                              previousState is! LoginError) {
                            showCustomSnackBar(context, state.error);
                          } else if (state is LoginSuccess) {
                            // Navigate to home screen or perform other actions
                            // Navigator.pushReplacementNamed(context, '/home');
                          }
                          previousState = state;
                        },
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 180.h),
                              Text(
                                locale.email,
                                style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,

                                  fontSize: 14.sp,
                                ),
                              ),
                              CustomEmailField(controller: emailController),
                              SizedBox(height: 35.h),
                              Text(
                                locale.password,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: greyColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              CustomPasswordField(
                                controller: passwordController,
                              ),
                              SizedBox(height: 40.h),
                              if (state is LoginLoading)
                                const Center(child: CircularProgressIndicator())
                              else
                                Column(
                                  children: [
                                    CustomButtonAuth(
                                      text: locale.sign_in,
                                      onPressed: () {
                                        context.read<LoginCubit>().login(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                          context,
                                        );
                                      },
                                    ),
                                    ForgotPasswordText(locale: locale),
                                    SizedBox(height: 20.h),
                                    CustomRichText(
                                      text: locale.dont_have_account,
                                      textButton: locale.signup,
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                        ).pushNamedAndRemoveUntil(
                                          AppRoutes.signup,
                                          (route) => false,
                                          arguments: 'signup',
                                        );
                                      },
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                ChangeLanguageButton(locale: locale),
                AppbarImage(),
                AppbarTitles(
                  title: locale.welcome_back,
                  subTitle: locale.sign_in_to_continue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
