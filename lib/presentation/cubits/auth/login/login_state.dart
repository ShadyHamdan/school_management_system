part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final bool obscurePassword;
  
  const LoginState({this.obscurePassword = true});

  @override
  List<Object> get props => [obscurePassword];
}

class LoginInitial extends LoginState {
  const LoginInitial({super.obscurePassword = true  });
  
}

class LoginLoading extends LoginState {
  const LoginLoading({super.obscurePassword});
}

class LoginSuccess extends LoginState {
  final String message;

  const LoginSuccess(this.message, {super.obscurePassword });

  @override
  List<Object> get props => [message, obscurePassword];
}

class LoginError extends LoginState {
  final String error;

  const LoginError(this.error, {super.obscurePassword });

  @override
  List<Object> get props => [error, obscurePassword];
}