import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/student_home/Medal.dart';
import 'package:school_management_system/presentation/cubits/home_student/Medal/Medal_state.dart';

class MedalsCubit extends Cubit<MedalsState> {
  MedalsCubit() : super(MedalsInitial());

  Future<void> fetchMedals(int studentId) async {
    emit(MedalsLoading());
    try {
      // TODO: ربط مع API لاحقًا
      // final response = await http.get(Uri.parse('API_URL'));
      // final data = jsonDecode(response.body);

      await Future.delayed(Duration(seconds: 1));
      List<Medal> medals = [
        Medal(
          title: "الطالب المثالي",
          description: "حصلت على أعلى تقييم سلوكي",
          imageUrl: "https://cdn-icons-png.flaticon.com/512/2583/2583399.png",
          count: 1,
        ),
        Medal(
          title: "الطالب المثالي",
          description: "حصلت على أعلى تقييم سلوكي",
          imageUrl: "https://cdn-icons-png.flaticon.com/512/2583/2583399.png",
          count: 2,
        ),
      ];

      if (medals.isEmpty) {
        emit(MedalsEmpty());
      } else {
        emit(MedalsLoaded(medals));
      }
    } catch (_) {
      emit(MedalsError("فشل في تحميل الأوسمة"));
    }
  }
}
