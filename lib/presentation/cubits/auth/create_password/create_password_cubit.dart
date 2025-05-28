import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'create_password_state.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(CreatePasswordInitial());

  Future<void> createPassword(String password1, String password2,BuildContext context) async {
        final locale = AppLocalizations.of(context)!;

    emit(CreatePasswordLoading());
    try {
      if (password1.isEmpty || password2.isEmpty) {
        emit(CreatePasswordError(locale.loginErrorFillFields));
        return;
      }

      if (password1 != password2) {
        emit( CreatePasswordError(locale.createPasswordErrorSamePassword));
        return;
      }
      if (password1.length < 6) {
        emit( CreatePasswordError(locale.loginErrorStrongPassword));
        return;
      }

      if (state is CreatePasswordLoading) {
        Future.delayed(Duration(seconds: 1), () {
          emit(CreatePasswordSuccess('success'));
        });
      }
    } catch (e) {
      emit(CreatePasswordError(e.toString()));
    }
  }

  void togglePasswordVisibility({required String fieldId}) {
    final currentObscure1 = state.obscurePassword1;
    final currentObscure2 = state.obscurePassword2;

    if (state is CreatePasswordInitial) {
      emit(
        CreatePasswordInitial(
          obscurePassword1: fieldId == '1' ? !currentObscure1 : currentObscure1,
          obscurePassword2: fieldId == '2' ? !currentObscure2 : currentObscure2,
        ),
      );
    } else if (state is CreatePasswordLoading) {
      emit(
        CreatePasswordLoading(
          obscurePassword1: fieldId == '1' ? !currentObscure1 : currentObscure1,
          obscurePassword2: fieldId == '2' ? !currentObscure2 : currentObscure2,
        ),
      );
    } else if (state is CreatePasswordSuccess) {
      emit(
        CreatePasswordSuccess(
          (state as CreatePasswordSuccess).message,
          obscurePassword1: fieldId == '1' ? !currentObscure1 : currentObscure1,
          obscurePassword2: fieldId == '2' ? !currentObscure2 : currentObscure2,
        ),
      );
    } else if (state is CreatePasswordError) {
      emit(
        CreatePasswordError(
          (state as CreatePasswordError).error,
          obscurePassword1: fieldId == '1' ? !currentObscure1 : currentObscure1,
          obscurePassword2: fieldId == '2' ? !currentObscure2 : currentObscure2,
        ),
      );
    }
  }
}
