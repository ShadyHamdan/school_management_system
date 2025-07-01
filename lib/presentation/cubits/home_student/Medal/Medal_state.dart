// State
import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/student_model/Medal.dart';

abstract class MedalsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MedalsInitial extends MedalsState {}

class MedalsLoading extends MedalsState {}

class MedalsLoaded extends MedalsState {
  final List<Medal> medals;
  MedalsLoaded(this.medals);
  @override
  List<Object?> get props => [medals];
}

class MedalsEmpty extends MedalsState {}

class MedalsError extends MedalsState {
  final String message;
  MedalsError(this.message);
  @override
  List<Object?> get props => [message];
}
