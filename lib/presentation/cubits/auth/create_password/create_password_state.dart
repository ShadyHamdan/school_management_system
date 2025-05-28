part of 'create_password_cubit.dart';

abstract class CreatePasswordState extends Equatable {
  final bool obscurePassword1;
  final bool obscurePassword2;

  const CreatePasswordState({
    this.obscurePassword1 = true,
    this.obscurePassword2 = true,
  });

  @override
  List<Object> get props => [obscurePassword1, obscurePassword2];
}

class CreatePasswordInitial extends CreatePasswordState {
  const CreatePasswordInitial({
    super.obscurePassword1 = true,
    super.obscurePassword2 = true,
  });
}

class CreatePasswordLoading extends CreatePasswordState {
  const CreatePasswordLoading({
    super.obscurePassword1 = true,
    super.obscurePassword2 = true,
  });
}

class CreatePasswordSuccess extends CreatePasswordState {
  final String message;

  const CreatePasswordSuccess(
    this.message, {
    super.obscurePassword1 = true,
    super.obscurePassword2 = true,
  });

  @override
  List<Object> get props => [message, obscurePassword1,obscurePassword2];
}

class CreatePasswordError extends CreatePasswordState {
  final String error;

  const CreatePasswordError(
    this.error, {
    super.obscurePassword1 = true,
    super.obscurePassword2 = true,
  });

  @override
  List<Object> get props => [error, obscurePassword1,obscurePassword2];
}
