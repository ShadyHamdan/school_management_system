import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_management_system/presentation/cubits/home_guardian/bus_tracking/bus_tracking_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_guardian/bus_tracking/bus_tracking_state.dart';

class BusTrackingPage extends StatelessWidget {
  final int parentId;

  const BusTrackingPage({required this.parentId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BusTrackingCubit()..fetchBusLocation(parentId),
      child: Scaffold(
        body: BlocBuilder<BusTrackingCubit, BusTrackingState>(
          builder: (context, state) {
            if (state is BusTrackingLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BusTrackingError) {
              return Center(child: Text(state.message));
            } else if (state is BusTrackingLoaded) {
              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(state.latitude, state.longitude),
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('bus'),
                        position: LatLng(state.latitude, state.longitude),
                        infoWindow: InfoWindow(title: 'موقع الحافلة'),
                      ),
                    },
                  ),
                  if (state.isGpsOffline)
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child: Card(
                        color: Colors.amber.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.warning, color: Colors.orange),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'انقطاع في إشارة GPS، يتم عرض آخر موقع معروف',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
