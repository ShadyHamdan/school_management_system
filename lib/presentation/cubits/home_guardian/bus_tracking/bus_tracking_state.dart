import 'package:equatable/equatable.dart';

abstract class BusTrackingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BusTrackingInitial extends BusTrackingState {}

class BusTrackingLoading extends BusTrackingState {}

class BusTrackingLoaded extends BusTrackingState {
  final double latitude;
  final double longitude;
  final bool isGpsOffline;

  BusTrackingLoaded({
    required this.latitude,
    required this.longitude,
    required this.isGpsOffline,
  });

  @override
  List<Object?> get props => [latitude, longitude, isGpsOffline];
}

class BusTrackingError extends BusTrackingState {
  final String message;

  BusTrackingError(this.message);

  @override
  List<Object?> get props => [message];
}
