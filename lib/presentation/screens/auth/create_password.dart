import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/create_password/create_password_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/widgets/auth/change_language_button.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_snack_bar.dart';
import 'package:school_management_system/presentation/widgets/create_password_widgets/custom_create_password_field.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_image.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repeatPasswordController =
        TextEditingController();
    final locale = AppLocalizations.of(context)!;

    CreatePasswordState? previousState;
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
                      child: BlocConsumer<
                        CreatePasswordCubit,
                        CreatePasswordState
                      >(
                        listener: (context, state) {
                          if (state is CreatePasswordError &&
                              previousState is! CreatePasswordError) {
                            showCustomSnackBar(context, state.error);
                          } else if (state is CreatePasswordSuccess) {
                            String task =
                                context
                                    .read<PreferencesCubit>()
                                    .getCreatePasswordTask();
                          task=="Create"?  Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.createProfile,
                            ):Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,);
                          }
                          previousState = state;
                        },
                        builder: (context, state) {
                          context.read<PreferencesCubit>().setLastVisitedPage(
                            AppRoutes.createPassword,
                          );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 200.h),
                              Text(
                                locale.enterPassword,
                                style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomCreatePasswordField(
                                fieldId: '1',
                                obscurePassword: state.obscurePassword1,
                                controller: passwordController,
                              ),
                              SizedBox(height: 35.w),
                              Text(
                                locale.repeatPassword,
                                style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomCreatePasswordField(
                                fieldId: '2',
                                obscurePassword: state.obscurePassword2,
                                controller: repeatPasswordController,
                              ),
                              SizedBox(height: 40),
                              if (state is CreatePasswordLoading)
                                const Center(child: CircularProgressIndicator())
                              else
                                Column(
                                  children: [
                                    CustomButtonAuth(
                                      text: locale.confirm,
                                      onPressed: () {
                                        context
                                            .read<CreatePasswordCubit>()
                                            .createPassword(
                                              passwordController.text.trim(),
                                              repeatPasswordController.text
                                                  .trim(),
                                              context,
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
                AppbarImage(),
                ChangeLanguageButton(locale: locale),

                AppbarTitles(
                  title: locale.createPasswordTitle,
                  subTitle: locale.createPasswordSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
