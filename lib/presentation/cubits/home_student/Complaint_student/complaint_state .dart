import 'package:equatable/equatable.dart';

class ComplaintState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ComplaintInitial extends ComplaintState {}

class ComplaintLoading extends ComplaintState {}

class ComplaintSuccess extends ComplaintState {}

class ComplaintFailure extends ComplaintState {
  final String message;
  ComplaintFailure(this.message);
  @override
  List<Object?> get props => [message];
}
