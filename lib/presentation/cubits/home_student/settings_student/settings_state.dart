part of 'settings_cubit.dart';

class SettingsState {
  final bool isDarkMode;
  final bool notificationsEnabled;
  final String language;

  SettingsState({
    required this.isDarkMode,
    required this.notificationsEnabled,
    required this.language,
  });

  SettingsState copyWith({
    bool? isDarkMode,
    bool? notificationsEnabled,
    String? language,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      language: language ?? this.language,
    );
  }
}
