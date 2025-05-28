import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key, required this.locale});

  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5.h,

      left:
          context.read<PreferencesCubit>().getSavedLocale() == Locale('en')
              ? 320.w
              : 5.w,
      child: IconButton(
        icon: Icon(Icons.language, size: 24.sp, color: whiteColor),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Row(children: [Text("${locale.change_language} :")]),
                  content: SizedBox(
                    height: 130.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  context
                                      .read<PreferencesCubit>()
                                      .changeLanguage(Locale('en'));
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'En',
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                            ),

                            Center(
                              child: TextButton(
                                onPressed: () {
                                  context
                                      .read<PreferencesCubit>()
                                      .changeLanguage(Locale('ar'));
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Ar',
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'cancel',
                            style: TextStyle(fontSize: 16.sp, color: greyColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}
