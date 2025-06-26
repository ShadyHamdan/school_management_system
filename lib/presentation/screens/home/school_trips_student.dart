import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/school_trips/trip_cubit.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripCubit>();
    final state = context.watch<TripCubit>().state;

    if (state.trips.isEmpty) {
      cubit.loadTrips();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.trips.length,
      itemBuilder: (context, index) {
        final trip = state.trips[index];

        return Card(
          color: cyanColor,
          child: ExpansionTile(
            key: Key(trip.title),
            initiallyExpanded: trip.isExpanded,
            onExpansionChanged: (_) => cubit.toggleExpanded(index),
            title: Text(
              trip.title,
              style: const TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "التاريخ: ${trip.date}",
              style: const TextStyle(color: whiteColor),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.description,
                      style: const TextStyle(color: whiteColor),
                    ),
                    const SizedBox(height: 10),
                    if (!trip.isJoined)
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(Icons.send),
                        label: const Text("إرسال طلب الانضمام"),
                        onPressed: () => cubit.joinTrip(index),
                      )
                    else
                      const Text(
                        "تم إرسال طلب الانضمام ✅",
                        style: TextStyle(color: Colors.white),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'trip_cubit.dart';
import 'trip_state.dart';
import 'trip_model.dart';
import 'package:school_management_system/core/constants/color.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TripCubit()..fetchTrips(),
      child: BlocBuilder<TripCubit, TripState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.trips.length,
            itemBuilder: (context, index) {
              final trip = state.trips[index];
              return ExpansionTile(
                backgroundColor: cyanColor,
                collapsedBackgroundColor: cyanColor,
                title: Text(
                  trip.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: whiteColor),
                ),
                subtitle: Text(
                  "تاريخ الرحلة: ${trip.date}",
                  style: const TextStyle(color: whiteColor),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      trip.description,
                      style: const TextStyle(color: whiteColor),
                    ),
                  ),
                  if (!trip.joined)
                    ElevatedButton(
                      onPressed: () {
                        context.read<TripCubit>().joinTrip(trip.id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: boldBlueColor,
                      ),
                      child: const Text("إرسال طلب انضمام"),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("تم إرسال طلب الانضمام بنجاح",
                          style: TextStyle(color: Colors.green)),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
*/