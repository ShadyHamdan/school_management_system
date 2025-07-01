// State
import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/suardian_model/student_performance.dart';

abstract class PerformanceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PerformanceInitial extends PerformanceState {}

class PerformanceLoading extends PerformanceState {}

class PerformanceLoaded extends PerformanceState {
  final StudentPerformance performance;
  PerformanceLoaded(this.performance);
  @override
  List<Object?> get props => [performance];
}

class PerformanceError extends PerformanceState {
  final String message;
  PerformanceError(this.message);
  @override
  List<Object?> get props => [message];
}
