import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/Complaint_student/complaint_state%20.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit() : super(ComplaintInitial());

  String type = 'general';
  String content = '';
  bool anonymous = false;

  void setType(String type) => type = type;
  bool get aanonymous => anonymous;

  void setContent(String content) => content = content;

  void setAnonymous(bool value) => anonymous = value;

  Future<void> submitComplaint(int studentId) async {
    emit(ComplaintLoading());

    try {
      // 🟡 TODO: استدعاء API لجلب عدد الشكاوى المجهولة لهذا الطالب خلال هذا الشهر
      // int anonymousCount = await getAnonymousComplaintsCount(studentId);
      // if (_anonymous && anonymousCount >= 3) {
      //   emit(ComplaintFailure("تم تجاوز الحد المسموح للشكاوى المجهولة لهذا الشهر."));
      //   return;
      // }

      // 🟡 TODO: استدعاء API لإرسال الشكوى
      // await sendComplaintToApi({
      //   "student_id": studentId,
      //   "type": _type,
      //   "content": _content,
      //   "anonymous": _anonymous,
      // });

      emit(ComplaintSuccess());
    } catch (e) {
      emit(ComplaintFailure("حدث خطأ أثناء إرسال الشكوى."));
    }
  }
}
