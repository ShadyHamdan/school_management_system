import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/student_home/trip.dart';

class TripState extends Equatable {
  final List<TripModel> trips;

  const TripState({this.trips = const []});

  TripState copyWith({List<TripModel>? trips}) {
    return TripState(trips: trips ?? this.trips);
  }

  @override
  List<Object?> get props => [trips];
}
/*
import 'package:equatable/equatable.dart';
import 'trip_model.dart';

class TripState extends Equatable {
  final List<Trip> trips;
  final bool isLoading;
  final String? error;

  const TripState({this.trips = const [], this.isLoading = false, this.error});

  TripState copyWith({
    List<Trip>? trips,
    bool? isLoading,
    String? error,
  }) {
    return TripState(
      trips: trips ?? this.trips,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [trips, isLoading, error];
}
*/