import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/notifications/notifications_cubit.dart';

class StudentNotificationsPage extends StatelessWidget {
  const StudentNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('الإشعارات')),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state.notifications.isEmpty) {
              return const Center(child: Text('لا توجد إشعارات حالياً'));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.notifications.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                return ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(notification),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
