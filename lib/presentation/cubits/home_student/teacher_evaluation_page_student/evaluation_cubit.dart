// Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/teacher_evaluation_page_student/evaluation_state.dart';

class TeacherEvaluationCubit extends Cubit<TeacherEvaluationState> {
  double _rating = 0.0;

  TeacherEvaluationCubit() : super(EvaluationInitial());

  void updateRating(double rating) {
    _rating = rating;
  }

  void updateComment(String comment) {}

  Future<void> submitEvaluation(int teacherId) async {
    if (_rating == 0) {
      emit(EvaluationFailure("يرجى اختيار تقييم النجوم."));
      return;
    }

    emit(EvaluationLoading());

    try {
      // هنا تضع كود ارسال التقييم الى السيرفر (API)
      // مثال: await api.submitTeacherEvaluation(teacherId, _rating, _comment);

      await Future.delayed(Duration(seconds: 2)); // محاكاة انتظار الرد

      emit(EvaluationSuccess());
    } catch (e) {
      emit(EvaluationFailure("حدث خطأ أثناء إرسال التقييم."));
    }
  }
}
