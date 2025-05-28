import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/announcement/announcement_Student_state.dart';

class AnnouncementStudentCubit extends Cubit<AnnouncementStudentState> {
  AnnouncementStudentCubit() : super(const AnnouncementStudentState());

  void toggleExpanded(int index) {
    final currentSet = Set<int>.from(state.expandedIndexes);
    if (currentSet.contains(index)) {
      currentSet.remove(index);
    } else {
      currentSet.add(index);
    }
    emit(state.copyWith(expandedIndexes: currentSet));
  }

  bool isExpanded(int index) {
    return state.expandedIndexes.contains(index);
  }

  // void loadAds() async {
  //   emit(state.copyWith(isLoading: true));
  //   try {
  //     // محاكاة تحميل البيانات (يمكن استبدالها بـ API)
  //     await Future.delayed(Duration(seconds: 2));
  //     final ads = [
  //       "عرض خاص على الكتب!",
  //       "انضم الآن إلى دورة البرمجة.",
  //       "رحلة مدرسية يوم الخميس القادم.",
  //     ];
  //     emit(state.copyWith(ads: ads, isLoading: false));
  //   } catch (e) {
  //     emit(state.copyWith(isLoading: false, error: "فشل تحميل الإعلانات"));
  //   }
  // }
}
