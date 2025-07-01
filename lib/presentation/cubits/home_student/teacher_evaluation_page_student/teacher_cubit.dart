// Cubit: Teachers List
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/teacher.dart';
import 'teacher_state.dart';

class TeachersCubit extends Cubit<TeachersState> {
  TeachersCubit() : super(TeachersInitial());

  Future<void> fetchTeachers() async {
    emit(TeachersLoading());

    // TODO: استبدال هذا بمحاكاة API
    await Future.delayed(Duration(seconds: 1));
    emit(
      TeachersLoaded([
        Teacher(
          id: 1,
          name: 'أ. أحمد',
          subject: 'رياضيات',
          imageUrl: 'https://i.pravatar.cc/150?img=3',
          experience: 5,
        ),
        Teacher(
          id: 2,
          name: 'أ. فاطمة',
          subject: 'لغة عربية',
          imageUrl: 'https://i.pravatar.cc/150?img=5',
          experience: 7,
        ),
      ]),
    );
  }
}
