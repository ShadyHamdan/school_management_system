import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/core/constants/pinput_feature.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/code_confirm/code_confirm_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/widgets/auth/change_language_button.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_snack_bar.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_image.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/signup_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CodeConfirm extends StatelessWidget {
  const CodeConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();
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
                      child: BlocConsumer<CodeConfirmCubit, CodeConfirmState>(
                        listener: (context, state) {
                          if (state is CodeConfirmError) {
                            showCustomSnackBar(context, state.error);
                          } else if (state is CodeConfirmSuccess) {
                            // Navigate to home screen or perform other actions
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.createPassword,
                            );
                          }
                        },
                        builder: (context, state) {
                          context.read<PreferencesCubit>().setLastVisitedPage(
                            AppRoutes.codeConfirm,
                          );

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 260.h),
                              Center(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Pinput(
                                    keyboardType: TextInputType.number,
                                    errorPinTheme: errorpinTheme,
                                    forceErrorState:
                                        state is CodeConfirmError
                                            ? true
                                            : false,
                                    controller: codeController,
                                    length: 5,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme:
                                        state is CodeConfirmSuccess
                                            ? successpinTheme
                                            : focusedPinTheme,
                                    submittedPinTheme:
                                        state is CodeConfirmSuccess
                                            ? successpinTheme
                                            : submittedPinTheme,
                                    pinputAutovalidateMode:
                                        PinputAutovalidateMode.onSubmit,

                                    onChanged: (value) {
                                      state is! CodeConfirmInitial
                                          ? context
                                              .read<CodeConfirmCubit>()
                                              .resetToInitial()
                                          : () {};
                                    },
                                    showCursor: true,
                                    onCompleted: (pin) {
                                      // print(pin);
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(height: 80.h),
                              if (state is CodeConfirmLoading)
                                const Center(child: CircularProgressIndicator())
                              else
                                Column(
                                  children: [
                                    CustomButtonAuth(
                                      text: locale.confirm,
                                      onPressed: () {
                                        context
                                            .read<CodeConfirmCubit>()
                                            .codeConfirm(codeController.text);
                                      },
                                    ),

                                    SizedBox(height: 20.h),
                                    CustomRichText(
                                      text: locale.codeNotReceived,
                                      textButton: locale.resend,
                                      onTap: () {},
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
                AppbarTitles(
                  title: locale.codeVerification,
                  subTitle:
                      '${locale.enterCodeSentToEmail} ${context.read<PreferencesCubit>().getUserEmail()!}',
                ),
                Positioned(
                  top: 370.h,
                  left:
                      context.read<PreferencesCubit>().getSavedLocale() ==
                              Locale('en')
                          ? 20.w
                          : 200.w,
                  child: TextButton(
                    child: Text(
                      locale.editEmail,

                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: boldBlueColor,
                        color: cyanColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        AppRoutes.signup,
                        arguments: 'codeConfirm',
                      );
                    },
                  ),
                ),

                ChangeLanguageButton(locale: locale),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
