// Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/teacher_evaluation_page_student/teacher_state.dart';

class TeachersCubit extends Cubit<TeachersState> {
  TeachersCubit() : super(TeachersInitial());

  Future<void> fetchTeachers() async {
    emit(TeachersLoading());

    // try {
    //  final teachers =   await fetchTeachersFromApi(); // استبدل هذه بالدالة الحقيقية
    //   emit(TeachersLoaded(teachers));
    // } catch (e) {
    //   emit(TeachersError('حدث خطأ أثناء تحميل المدرسين'));
    // }
  }
}
