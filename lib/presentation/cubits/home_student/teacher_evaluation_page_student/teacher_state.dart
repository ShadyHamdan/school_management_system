import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:school_management_system/core/constants/teacher.dart';

// الحالات
abstract class TeachersState extends Equatable {
  const TeachersState();

  @override
  List<Object?> get props => [];
}

class TeachersInitial extends TeachersState {}

class TeachersLoading extends TeachersState {}

class TeachersLoaded extends TeachersState {
  final List<Teacher> teachers;

  const TeachersLoaded(this.teachers);

  @override
  List<Object?> get props => [teachers];
}

class TeachersError extends TeachersState {
  final String message;

  const TeachersError(this.message);

  @override
  List<Object?> get props => [message];
}
