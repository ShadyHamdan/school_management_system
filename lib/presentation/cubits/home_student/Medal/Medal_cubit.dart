import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/student_home/Medal.dart';
import 'package:school_management_system/presentation/cubits/home_student/Medal/Medal_state.dart';

class MedalsCubit extends Cubit<MedalsState> {
  MedalsCubit() : super(MedalsInitial());

  Future<void> fetchMedals(int studentId) async {
    emit(MedalsLoading());

    try {
      // محاكاة الاتصال بـ API
      await Future.delayed(Duration(seconds: 1));

      // هذا مجرد مثال، قم بربطه بـ API حقيقي
      List<Medal> medals = [
        Medal(
          title: "الطالب المثالي",
          description: "حصلت على أعلى تقييم سلوكي",
          imageUrl: "appbar_image.png",
          count: 1,
        ),
        Medal(
          title: "الطالب المثالي",
          description: "حصلت على أعلى تقييم سلوكي",
          imageUrl: "appbar_image.png",
          count: 2,
        ),
      ];

      if (medals.isEmpty) {
        emit(MedalsEmpty());
      } else {
        emit(MedalsLoaded(medals));
      }
    } catch (e) {
      emit(MedalsError("فشل في تحميل الأوسمة"));
    }
  }
}
