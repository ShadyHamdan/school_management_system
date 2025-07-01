part of 'notifications_cubit.dart';

class NotificationsState {
  final List<String> notifications;

  NotificationsState({required this.notifications});

  NotificationsState copyWith({List<String>? notifications}) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
    );
  }
}
