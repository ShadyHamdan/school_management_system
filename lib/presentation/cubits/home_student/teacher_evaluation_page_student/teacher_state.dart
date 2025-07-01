// State: Teachers List
import 'package:equatable/equatable.dart';
import 'package:school_management_system/core/constants/teacher.dart';

abstract class TeachersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TeachersInitial extends TeachersState {}

class TeachersLoading extends TeachersState {}

class TeachersLoaded extends TeachersState {
  final List<Teacher> teachers;
  TeachersLoaded(this.teachers);

  @override
  List<Object?> get props => [teachers];
}

class TeachersError extends TeachersState {
  final String message;
  TeachersError(this.message);

  @override
  List<Object?> get props => [message];
}
