import 'package:equatable/equatable.dart';

// حالات التقييم
abstract class TeacherEvaluationState extends Equatable {
  const TeacherEvaluationState();

  @override
  List<Object?> get props => [];
}

class EvaluationInitial extends TeacherEvaluationState {}

class EvaluationLoading extends TeacherEvaluationState {}

class EvaluationSuccess extends TeacherEvaluationState {}

class EvaluationFailure extends TeacherEvaluationState {
  final String errorMessage;
  const EvaluationFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
