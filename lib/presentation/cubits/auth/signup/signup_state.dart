part of 'signup_cubit.dart';



abstract class SignupState extends Equatable {
  
  
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  final String message;

  const SignupSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class SignupError extends SignupState {
  final String error;

  const SignupError(this.error);

  @override
  List<Object> get props => [error];
}