import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'code_confirm_state.dart';

class CodeConfirmCubit extends Cubit<CodeConfirmState> {
  CodeConfirmCubit() : super(CodeConfirmInitial());

  Future<void> codeConfirm(String code) async {
    emit(CodeConfirmLoading());
    try {
      if (code.length < 5) {
        emit(const CodeConfirmError('Please fill in all fields'));
        return;
      }

      if (!_isCodeValid(code)) {
        emit(const CodeConfirmError('Enter a code that contains numbers only'));
        return;
      }

      if (code != "22222") {
        emit(const CodeConfirmError('The code is incorrect, please check'));
        return;
      }
      if (state is CodeConfirmLoading) {
        Future.delayed(Duration(seconds: 1), () {
          emit(CodeConfirmSuccess('success'));
        });
      }
    } catch (e) {
      emit(CodeConfirmError(e.toString()));
    }
  }

  bool _isCodeValid(String code) {
    return RegExp(r'^[0-9]+$').hasMatch(code);
  }

  void resetToInitial() {
    emit(CodeConfirmInitial());
  }
}
