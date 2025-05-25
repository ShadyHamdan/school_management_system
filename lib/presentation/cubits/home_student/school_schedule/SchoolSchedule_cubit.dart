import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_schedule/SchoolSchedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState(selectedDay: "السبت", schedule: {}));

  void selectDay(String day) {
    emit(state.copyWith(selectedDay: day));
  }

  // Future<void> fetchSchedule() async {
  //   emit(state.copyWith(loading: true, error: null));
  //   try {
  //     // تخيل هنا أنك تطلب API وترجع JSON
  //     final response = await Future.delayed(Duration(seconds: 2), () {
  //       return mockApiJson; // افترض أنه جاي من API
  //     });

  //     final schedule = <String, List<ClassPeriod>>{};
  //     response.forEach((day, classes) {
  //       schedule[day] =
  //           (classes as List).map((c) => ClassPeriod.fromJson(c)).toList();
  //     });

  //     emit(ScheduleState(schedule: schedule));
  //   } catch (e) {
  //     emit(state.copyWith(loading: false, error: "حدث خطأ أثناء جلب البيانات"));
  //   }
  // }
}
