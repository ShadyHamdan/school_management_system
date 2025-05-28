import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/create_profile/create_profile_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/widgets/auth/change_language_button.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_snack_bar.dart';
import 'package:school_management_system/presentation/widgets/create_profile_widgets/dot_widget.dart';
import 'package:school_management_system/presentation/widgets/create_profile_widgets/first_page.dart';
import 'package:school_management_system/presentation/widgets/create_profile_widgets/next_and_back_button.dart';
import 'package:school_management_system/presentation/widgets/create_profile_widgets/second_page.dart';
import 'package:school_management_system/presentation/widgets/create_profile_widgets/third_page.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_image.dart';
import 'package:school_management_system/presentation/widgets/login_widgets/appbar_titles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController dayController = TextEditingController();
    final TextEditingController monthController = TextEditingController();
    final TextEditingController yearController = TextEditingController();
    final PageController pageController = PageController();
    final locale = AppLocalizations.of(context)!;

    CreateProfileState? previousState;
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
                  top: 200.h,
                  child: Container(
                    height: 650.h,
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
                        CreateProfileCubit,
                        CreateProfileState
                      >(
                        listener: (context, state) {
                          if (state is CreateProfileError &&
                              previousState is! CreateProfileError) {
                            showCustomSnackBar(context, state.error);
                          } else if (state is CreateProfileSuccess) {
                            // Navigate to home screen or perform other actions
                            // Navigator.pushReplacementNamed(context, '/home');
                          }
                          previousState = state;
                        },
                        builder: (context, state) {
                          context.read<PreferencesCubit>().setLastVisitedPage(
                            AppRoutes.createProfile,
                          );

                          List<Widget> customPageViewItems = [
                            firstPage(
                              nameController,
                              phoneNumberController,
                              context,
                            ),
                            secondPage(
                              yearController,
                              monthController,
                              dayController,
                              context,
                            ),
                            thirdPage(state, context),
                          ];
                          return Column(
                            children: [
                              SizedBox(height: 20.h),
                              SizedBox(
                                height: 430.h,
                                width: 500.w,
                                child: PageView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: customPageViewItems.length,
                                  onPageChanged: (index) {
                                    context
                                        .read<CreateProfileCubit>()
                                        .updateCurrentIndex(index);
                                  },
                                  controller: pageController,
                                  itemBuilder: (context, index) {
                                    return customPageViewItems[index];
                                  },
                                ),
                              ),

                              DotWidget(state: state),

                              SizedBox(height: 45.h),
                              NextAndBackButton(
                                pageController: pageController,
                                nameController: nameController,
                                phoneNumberController: phoneNumberController,
                                dayController: dayController,
                                monthController: monthController,
                                yearController: yearController,
                                context: context,
                                state: state,
                              ),

                              SizedBox(height: 20.h),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // ChangeLanguageButton(locale: locale),
                AppbarImage(),
                AppbarTitles(
                  title: locale.createProfile,
                  subTitle: locale.completeYourProfileInformation,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
