import 'package:flutter_bloc/flutter_bloc.dart';
import 'bus_tracking_state.dart';

class BusTrackingCubit extends Cubit<BusTrackingState> {
  BusTrackingCubit() : super(BusTrackingInitial());

  Future<void> fetchBusLocation(int parentId) async {
    emit(BusTrackingLoading());

    try {
      await Future.delayed(Duration(seconds: 2)); // محاكاة استجابة API

      // TODO: كود الربط الحقيقي بـ API (معلق مؤقتاً)
      // final response = await http.get(Uri.parse('https://api.school.com/parent/$parentId/bus_location'));
      // if (response.statusCode == 200) {
      //   final data = jsonDecode(response.body);
      //   emit(BusTrackingLoaded(
      //     latitude: data['lat'],
      //     longitude: data['lng'],
      //     isGpsOffline: false,
      //   ));
      // } else {
      //   throw Exception("GPS Offline");
      // }

      // بيانات ثابتة مؤقتة مع إشارة GPS غير متوفرة
      emit(
        BusTrackingLoaded(
          latitude: 33.5138,
          longitude: 36.2765,
          isGpsOffline: true,
        ),
      );
    } catch (e) {
      emit(BusTrackingError("فشل في تحميل موقع الحافلة"));
    }
  }
}
