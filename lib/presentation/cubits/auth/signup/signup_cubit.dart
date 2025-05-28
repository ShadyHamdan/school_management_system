import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup(String email,BuildContext context) async {
    final locale = AppLocalizations.of(context)!;

    emit(SignupLoading());
    try {
      if (email.isEmpty) {
        emit( SignupError(locale.loginErrorFillFields));
        return;
      }

      if (!_isEmailValid(email)) {
        emit( SignupError(locale.loginErrorValidEmail));
        return;
      }

      // Call repository for authentication
      // final response = await authRepository.Signup(email, password);

      // if (response.success) {
      //   emit(SignupSuccess(response.message));
      // } else {
      //   emit(SignupError(response.message));
      // }

      if (state is SignupLoading) {
        Future.delayed(Duration(seconds: 1), () {
          emit(SignupSuccess('success'));
        });
      }
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }

  bool _isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
