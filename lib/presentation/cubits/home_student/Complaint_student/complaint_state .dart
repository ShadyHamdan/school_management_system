import 'package:equatable/equatable.dart';

class ComplaintStudentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ComplaintInitial extends ComplaintStudentState {}

class ComplaintLoading extends ComplaintStudentState {}

class ComplaintSuccess extends ComplaintStudentState {}

class ComplaintFailure extends ComplaintStudentState {
  final String message;
  ComplaintFailure(this.message);
  @override
  List<Object?> get props => [message];
}
