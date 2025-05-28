import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());



  Future<void> login(String email, String password,BuildContext context) async {
    final locale = AppLocalizations.of(context)!;

    emit(LoginLoading(),);
    try {
      if (email.isEmpty || password.isEmpty) {
        emit( LoginError(locale.loginErrorFillFields));
        return;
      }

      if (!_isEmailValid(email)) {
        emit( LoginError(locale.loginErrorValidEmail));
        return;
      }
      if (password.length < 6) {
        emit( LoginError(locale.loginErrorStrongPassword));
        return;
      }

      // Call repository for authentication
      // final response = await authRepository.login(email, password);

      // if (response.success) {
      //   emit(LoginSuccess(response.message));
      // } else {
      //   emit(LoginError(response.message));
      // }
    } catch (e) {
      emit(LoginError(e.toString(),obscurePassword: state.obscurePassword));
    }
  }
void togglePasswordVisibility() {
  final currentObscure = state.obscurePassword;
  
  if (state is LoginInitial) {
    emit(LoginInitial(obscurePassword: !currentObscure));
  } 
  else if (state is LoginLoading) {
    emit(LoginLoading(obscurePassword: !currentObscure));
  }
  else if (state is LoginSuccess) {
    emit(LoginSuccess(
      (state as LoginSuccess).message,
      obscurePassword: !currentObscure,
    ));
  }
  else if (state is LoginError) {
    emit(LoginError(
      (state as LoginError).error,
      obscurePassword: !currentObscure,
    ));
  }
}

  bool _isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
