import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/presentation/cubits/Preferences/preferences_cubit.dart';
import 'package:school_management_system/presentation/cubits/auth/create_profile/create_profile_cubit.dart';
import 'package:school_management_system/presentation/widgets/auth/custom_button_auth.dart';

class NextAndBackButton extends StatelessWidget {
  const NextAndBackButton({
    super.key,
    required this.pageController,
    required this.nameController,
    required this.phoneNumberController,
    required this.dayController,
    required this.monthController,
    required this.yearController,
    required this.state,
    required this.context,
  });

  final CreateProfileState state;
  final PageController pageController;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;
  final BuildContext context;
  bool get _isEnglishLocale =>
      context.read<PreferencesCubit>().getSavedLocale() == Locale('en');

  void _handleBackAction() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNextAction() {
    if (state.currentIndex == 0) {
      context.read<CreateProfileCubit>().firstStepVaildate(
        nameController.text,
        phoneNumberController.text,
        pageController,
        context,
      );
    } else if (state.currentIndex == 1) {
      context.read<CreateProfileCubit>().secondStepVaildate(
        dayController.text,
        monthController.text,
        yearController.text,
        pageController,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(
            text: _isEnglishLocale ? 'Back' : 'التالي',
            textDirection: TextDirection.rtl,
            onPressed: _isEnglishLocale ? _handleBackAction : _handleNextAction,
          ),
          _buildButton(
            text: _isEnglishLocale ? 'Next' : 'السابق',
            textDirection: TextDirection.ltr,
            onPressed: _isEnglishLocale ? _handleNextAction : _handleBackAction,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required TextDirection textDirection,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 144.w,
      child: Directionality(
        textDirection: textDirection,
        child: CustomButtonAuth(
          text: text,
          onPressed: onPressed,
          fontSize: 13.3,
        ),
      ),
    );
  }
}
