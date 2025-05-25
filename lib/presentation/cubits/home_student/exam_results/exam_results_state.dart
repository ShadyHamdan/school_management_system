import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/StudentExamResults.dart';

class ExamResultsState extends Equatable {
  final Map<String, List<ExamResultModel>> categorizedResults;
  final bool isLoading;

  const ExamResultsState({
    this.categorizedResults = const {},
    this.isLoading = false,
  });

  ExamResultsState copyWith({
    Map<String, List<ExamResultModel>>? categorizedResults,
    bool? isLoading,
  }) {
    return ExamResultsState(
      categorizedResults: categorizedResults ?? this.categorizedResults,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [categorizedResults, isLoading];
}
