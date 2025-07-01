// Cubit: Teacher Evaluation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'evaluation_state.dart';

class TeacherEvaluationCubit extends Cubit<TeacherEvaluationState> {
  double _rating = 0.0;
  String _comment = '';

  TeacherEvaluationCubit() : super(EvaluationInitial());

  void updateRating(double rating) {
    _rating = rating;
  }

  void updateComment(String comment) {
    _comment = comment;
  }

  Future<void> submitEvaluation(int teacherId) async {
    if (_rating == 0) {
      emit(EvaluationFailure("يرجى اختيار تقييم النجوم."));
      return;
    }

    emit(EvaluationLoading());

    try {
      // TODO: إرسال التقييم إلى API
      // await api.submitTeacherEvaluation(teacherId, _rating, _comment);

      await Future.delayed(Duration(seconds: 2));
      emit(EvaluationSuccess());
    } catch (e) {
      emit(EvaluationFailure("حدث خطأ أثناء إرسال التقييم."));
    }
  }
}
