import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/student_model/StudentExamResults.dart';
import 'package:school_management_system/presentation/cubits/home_student/exam_results/exam_results_state.dart';

class ExamResultsCubit extends Cubit<ExamResultsState> {
  ExamResultsCubit() : super(const ExamResultsState());

  void loadResults() {
    emit(state.copyWith(isLoading: true));

    // بيانات وهمية
    final data = {
      'الاختبارات الشهرية': [
        ExamResultModel(
          category: 'الاختبارات الشهرية',
          subject: 'الرياضيات',
          score: 18,
          total: 20,
        ),
        ExamResultModel(
          category: 'الاختبارات الشهرية',
          subject: 'اللغة العربية',
          score: 17,
          total: 20,
        ),
      ],
      'الاختبارات الفصلية': [
        ExamResultModel(
          category: 'الاختبارات الفصلية',
          subject: 'الرياضيات',
          score: 45,
          total: 50,
        ),
        ExamResultModel(
          category: 'الاختبارات الفصلية',
          subject: 'اللغة الإنجليزية',
          score: 40,
          total: 50,
        ),
      ],
      'الاختبارات النهائية': [
        ExamResultModel(
          category: 'الاختبارات النهائية',
          subject: 'العلوم',
          score: 85,
          total: 100,
        ),
        ExamResultModel(
          category: 'الاختبارات النهائية',
          subject: 'التربية الإسلامية',
          score: 90,
          total: 100,
        ),
      ],
    };

    emit(state.copyWith(categorizedResults: data, isLoading: false));
  }
}
