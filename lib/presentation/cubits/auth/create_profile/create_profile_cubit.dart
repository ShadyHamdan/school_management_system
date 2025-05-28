import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileInitial());

  Future<void> firstStepVaildate(
    String name,
    String phoneNumber,
    PageController pageController,
    BuildContext context,
  ) async {

        final locale = AppLocalizations.of(context)!;

    emit(CreateProfileLoading(currentIndex: state.currentIndex));
    try {
      if (name.isEmpty || phoneNumber.isEmpty) {
        emit(
          CreateProfileError(
            locale.loginErrorFillFields,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      } else if (!_isNameValid(name)) {
        emit(
          CreateProfileError(
            locale.createProfileErrorValidName,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      } else if (name.length < 6) {
        emit(
          CreateProfileError(
            locale.createProfileErrorFullName,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      } else if (!_isPhoneNumberValid(phoneNumber)) {
        emit(
          CreateProfileError(
            locale.createProfileErrorValidPhone,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      } else if (phoneNumber.length < 10) {
        emit(
          CreateProfileError(
            locale.createProfileErrorFullNumber,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      } else {
        if (pageController.hasClients && state is! CreateProfileError) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }

      // Call repository for authentication
      // final response = await authRepository.login(email, password);

      // if (response.success) {
      //   emit(LoginSuccess(response.message));
      // } else {
      //   emit(LoginError(response.message));
      // }
    } catch (e) {
      emit(CreateProfileError(e.toString(), currentIndex: state.currentIndex));
    }
  }

  Future<void> secondStepVaildate(
    String day,
    String month,
    String year,
    PageController pageController,
    BuildContext context
  ) async {
        final locale = AppLocalizations.of(context)!;

    emit(CreateProfileLoading(currentIndex: state.currentIndex));
    try {
      if (day.isEmpty || month.isEmpty || year.isEmpty) {
        emit(
          CreateProfileError(
            locale.loginErrorFillFields,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      }  if (!_isPhoneNumberValid(day)) {
        emit(
          CreateProfileError(
            locale.createProfileErrorValidDay,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      }  if (!_isPhoneNumberValid(month)) {
        emit(
          CreateProfileError(
            locale.createProfileErrorValidMonth,
            currentIndex: state.currentIndex,
          ),
        );
        return;
      }  if (!_isPhoneNumberValid(year)) {
        emit(
          CreateProfileError(
            locale.createProfileErrorValidYear,
            currentIndex: state.currentIndex,
          ),
        );
        return;
        
      }
       // تحويل القيم إلى أرقام
    final int dayInt = int.parse(day);
    final int monthInt = int.parse(month);
    final int yearInt = int.parse(year);
      if (monthInt < 1 || monthInt > 12) {
      emit(CreateProfileError(
        locale.createProfileErrorValidMonth,
        currentIndex: state.currentIndex,
      ));
      return;
    }

    if (dayInt < 1 || dayInt > 31) {
      emit(CreateProfileError(
        locale.createProfileErrorValidDay,
        currentIndex: state.currentIndex,
      ));
      return;
    }
 // التحقق من صحة أيام الأشهر (بما في ذلك فبراير والسنة الكبيسة)
    if (dayInt > _daysInMonth(monthInt, yearInt)) {
      emit(CreateProfileError(
        locale.createProfileErrorValidYear,
        currentIndex: state.currentIndex,
      ));
      return;
    }
    final currentDate = DateTime.now();
    final inputDate = DateTime(yearInt, monthInt, dayInt);
    if (inputDate.isAfter(currentDate)) {
      emit(CreateProfileError(
        locale.createProfileErrorValidYear,
        currentIndex: state.currentIndex,
      ));
      return;
    }
      
       
        if (pageController.hasClients && state is! CreateProfileError) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      
    } catch (e) {
      emit(CreateProfileError(e.toString(), currentIndex: state.currentIndex));
    }
  }

  void updateCurrentIndex(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }

  void updateGender(String newGender) {
    emit(state.copyWith(gender: newGender));
  }

  void updateAttribute(String newAttribute) {
    emit(state.copyWith(attribute: newAttribute));
  }

  bool _isPhoneNumberValid(String code) {
    return RegExp(r'^[0-9]+$').hasMatch(code);
  }

  bool _isNameValid(String name) {
    return RegExp(
      r'^[a-zA-Z\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF ]+$',
    ).hasMatch(name);
  }

  
// دالة مساعدة لحساب عدد أيام الشهر
int _daysInMonth(int month, int year) {
  if (month == 2) {
    return _isLeapYear(year) ? 29 : 28;
  } else if ([4, 6, 9, 11].contains(month)) {
    return 30;
  }
  return 31;
}

// دالة مساعدة للتحقق من السنة الكبيسة
bool _isLeapYear(int year) {
  return (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
}

// دالة مساعدة للتحقق من أن القيمة رقمية
bool _isNumberValid(String value) {
  return RegExp(r'^[0-9]+$').hasMatch(value);
}
}
