part of 'code_confirm_cubit.dart';

abstract class CodeConfirmState extends Equatable {
  final bool obscurePassword;

  const CodeConfirmState({this.obscurePassword = true});

  @override
  List<Object> get props => [obscurePassword];
}

class CodeConfirmInitial extends CodeConfirmState {
  const CodeConfirmInitial({super.obscurePassword = true});
}

class CodeConfirmLoading extends CodeConfirmState {
  const CodeConfirmLoading({super.obscurePassword = true});
}

class CodeConfirmSuccess extends CodeConfirmState {
  final String message;

  const CodeConfirmSuccess(this.message, {super.obscurePassword = true});

  @override
  List<Object> get props => [message, obscurePassword];
}

class CodeConfirmError extends CodeConfirmState {
  final String error;

  const CodeConfirmError(this.error, {super.obscurePassword = true});

  @override
  List<Object> get props => [error, obscurePassword];
}
