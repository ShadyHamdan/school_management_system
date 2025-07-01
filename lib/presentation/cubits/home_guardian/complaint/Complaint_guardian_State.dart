import 'package:equatable/equatable.dart';

class ComplaintGuardianState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ComplaintInitial extends ComplaintGuardianState {}

class ComplaintLoading extends ComplaintGuardianState {}

class ComplaintSuccess extends ComplaintGuardianState {}

class ComplaintFailure extends ComplaintGuardianState {
  final String message;
  ComplaintFailure(this.message);
  @override
  List<Object?> get props => [message];
}
