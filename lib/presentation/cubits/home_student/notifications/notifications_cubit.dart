import 'package:flutter_bloc/flutter_bloc.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState(notifications: [])) {
    loadNotifications();
  }

  void loadNotifications() {
    // بيانات ثابتة مؤقتًا
    final dummyData = [
      'تم إضافة علامة جديدة في مادة الرياضيات.',
      'لديك ملاحظة من المعلم في مادة العلوم.',
      'تمت الموافقة على رحلتك المدرسية.',
      'سيتم عقد اختبار في مادة التاريخ يوم الإثنين.',
    ];

    emit(state.copyWith(notifications: dummyData));

    // TODO: ربط مع Firebase أو API:
    // مثال:
    // FirebaseFirestore.instance.collection('notifications')
    //   .where('studentId', isEqualTo: currentStudentId)
    //   .get().then((snapshot) => {...});
  }

  void addNotification(String message) {
    final updatedList = List<String>.from(state.notifications)
      ..insert(0, message);
    emit(state.copyWith(notifications: updatedList));

    // TODO: إرسال الإشعار الجديد إلى السيرفر أو قاعدة البيانات
  }
}
