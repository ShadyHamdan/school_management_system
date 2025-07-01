// Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/suardian_model/student_performance.dart';
import 'package:school_management_system/presentation/cubits/home_guardian/Student_performance/performance_state.dart';

class PerformanceCubit extends Cubit<PerformanceState> {
  PerformanceCubit() : super(PerformanceInitial());

  Future<void> fetchPerformance(int studentId, int parentId) async {
    emit(PerformanceLoading());

    // TODO: تحقق من ملكية الطالب الحقيقية لاحقًا باستخدام API
    if (!_isStudentBelongsToParent(studentId, parentId)) {
      emit(PerformanceError('لا يمكنك الوصول إلى بيانات هذا الطالب'));
      return;
    }

    try {
      await Future.delayed(Duration(seconds: 1));

      // بيانات ثابتة مؤقتًا
      StudentPerformance performance = StudentPerformance(
        attendancePercentage: 92.3,
        absencePercentage: 7.7,
        averageGrade: 85.6,
      );

      emit(PerformanceLoaded(performance));
    } catch (_) {
      emit(PerformanceError('حدث خطأ أثناء تحميل البيانات'));
    }
  }

  bool _isStudentBelongsToParent(int studentId, int parentId) {
    // TODO: تحقق فعلي من API
    return parentId == 1; // مؤقتًا كل الآباء رقمهم 1 هم المصرح لهم
  }
}
