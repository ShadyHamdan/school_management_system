import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
    : super(
        SettingsState(
          isDarkMode: false,
          notificationsEnabled: true,
          language: 'العربية',
        ),
      );

  void toggleDarkMode(bool value) {
    emit(state.copyWith(isDarkMode: value));
    // TODO: إرسال الحالة الجديدة إلى API (الوضع الليلي)
  }

  void toggleNotifications(bool value) {
    emit(state.copyWith(notificationsEnabled: value));
    // TODO: إرسال الحالة الجديدة إلى API (الإشعارات)
  }

  void changeLanguage(String lang) {
    emit(state.copyWith(language: lang));
    // TODO: تحديث اللغة في السيرفر
  }
}
