import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/trip.dart';
import 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(const TripState());

  void loadTrips() {
    final demoTrips = [
      TripModel(
        title: 'رحلة إلى المتحف الوطني',
        description: 'زيارة تعليمية للمتحف الوطني في المدينة.',
        date: '2025-11-10',
      ),
      TripModel(
        title: 'رحلة إلى الحديقة العامة',
        description: 'نشاط ترفيهي في الهواء الطلق.',
        date: '2025-12-01',
      ),
    ];

    emit(state.copyWith(trips: demoTrips));
  }

  void toggleExpanded(int index) {
    final updated =
        state.trips.asMap().entries.map((entry) {
          if (entry.key == index) {
            return entry.value.copyWith(isExpanded: !entry.value.isExpanded);
          }
          return entry.value;
        }).toList();

    emit(state.copyWith(trips: updated));
  }

  void joinTrip(int index) {
    final updated =
        state.trips.asMap().entries.map((entry) {
          if (entry.key == index) {
            return entry.value.copyWith(isJoined: true);
          }
          return entry.value;
        }).toList();

    emit(state.copyWith(trips: updated));
  }
}
/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'trip_state.dart';
import 'trip_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(const TripState());

  Future<void> fetchTrips() async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await http.get(Uri.parse('https://yourapi.com/trips'));
      final data = json.decode(response.body) as List;
      final trips = data.map((e) => Trip.fromJson(e)).toList();
      emit(state.copyWith(trips: trips, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> joinTrip(int id) async {
    try {
      await http.post(Uri.parse('https://yourapi.com/trips/$id/join'));
      final updatedTrips = state.trips.map((trip) {
        if (trip.id == id) {
          return Trip(
            id: trip.id,
            title: trip.title,
            description: trip.description,
            date: trip.date,
            joined: true,
          );
        }
        return trip;
      }).toList();
      emit(state.copyWith(trips: updatedTrips));
    } catch (e) {
      emit(state.copyWith(error: 'فشل إرسال الطلب.'));
    }
  }
}
*/