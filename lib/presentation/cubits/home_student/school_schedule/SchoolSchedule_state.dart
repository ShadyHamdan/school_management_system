import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/student_home/schedule.dart';

class ScheduleState extends Equatable {
  final Map<String, List<ClassPeriod>> schedule;
  final bool loading;
  final String? error;
  final String selectedDay;

  const ScheduleState({
    required this.schedule,
    this.loading = false,
    this.error,
    required this.selectedDay,
  });

  ScheduleState copyWith({
    Map<String, List<ClassPeriod>>? schedule,
    bool? loading,
    String? error,
    required String selectedDay,
  }) {
    return ScheduleState(
      schedule: schedule ?? this.schedule,
      loading: loading ?? this.loading,
      error: error,
      selectedDay: selectedDay,
    );
  }

  @override
  List<Object?> get props => [schedule, loading, error, selectedDay];
}
