import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/signup/signup_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/widgets/auth/back_icon.dart';
import 'package:school_management_system/presentation/widgets/auth/change_language_button.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_snack_bar.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_image.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/custom_email_field.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/signup_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Signup extends StatelessWidget {
  final String? previosPage;

  const Signup({super.key, this.previosPage});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final bool isForgetPassScreen = (previosPage == 'forgetpassword');
    emailController.text =
        previosPage == 'codeConfirm'
            ? context.read<PreferencesCubit>().getUserEmail()
            : '';

    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: boldBlueColor,
      body: ListView(
        children: [
          SizedBox(
            height: 780.h,
            width: 375.w,
            child: Stack(
              children: [
                Positioned(
                  top: 210.h,
                  child: Container(
                    height: 600.h,
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
                      child: BlocConsumer<SignupCubit, SignupState>(
                        listener: (context, state) {
                          if (state is SignupError) {
                            showCustomSnackBar(context, state.error);
                          } else if (state is SignupSuccess) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.codeConfirm,
                              arguments: emailController.text,
                            );
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 250.h),
                              Text(
                                locale.email,
                                style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomEmailField(
                                controller: emailController,
                                hintText: 'example@gmail.com',
                              ),
                              SizedBox(height: 35.h),
                              SizedBox(height: 40.h),
                              if (state is SignupLoading)
                                const Center(child: CircularProgressIndicator())
                              else
                                Column(
                                  children: [
                                    CustomButtonAuth(
                                      text: locale.signup_confirm_button,
                                      onPressed: () {
                                        context
                                            .read<PreferencesCubit>()
                                            .setUserEmail(emailController.text);
                                        String task =
                                            isForgetPassScreen
                                                ? "Reset"
                                                : "Create";
                                        context
                                            .read<PreferencesCubit>()
                                            .setCreatePasswordTask(
                                              task,
                                            );
                                        context.read<SignupCubit>().signup(
                                          emailController.text.trim(),
                                          context,
                                        );
                                      },
                                    ),

                                    SizedBox(height: 20.h),
                                    !isForgetPassScreen
                                        ? CustomRichText(
                                          text: locale.signup_have_account,
                                          textButton:
                                              locale.signup_login_button,
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                            ).pushNamedAndRemoveUntil(
                                              '/Login',
                                              (route) => false,
                                            );
                                          },
                                        )
                                        : SizedBox(),
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
                isForgetPassScreen ? BackIcon() : SizedBox(),
                isForgetPassScreen
                    ? AppbarTitles(
                      title: locale.reset_password_title,
                      subTitle: locale.reset_password_subtitle,
                    )
                    : AppbarTitles(
                      title: locale.signup_welcome_title,
                      subTitle: locale.signup_welcome_subtitle,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
