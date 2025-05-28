import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  final SharedPreferences prefs;
  static const String _localeKey = 'language';
  static const String _themeKey = 'theme';
  static const String _lastPageKey = 'last_visited_page';
  static const String _firstLaunchKey = 'isFirstLaunch';
  static const String _userEmailKey = 'userEmail';
  static const String _createPasswordTask = 'createPasswordTask';

  PreferencesCubit(this.prefs) : super(PreferencesInitial()) {
    loadPreferences();
  }

  static Locale _getDeviceLocale() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    return deviceLocale;
  }

  Future<void> loadPreferences() async {
    try {
      final savedLocale = prefs.getString(_localeKey);
      final locale =
          savedLocale != null ? Locale(savedLocale) : _getDeviceLocale();

      emit(
        PreferencesLoaded(
          theme: prefs.getString(_themeKey) ?? 'light',
          language: locale.languageCode,
          lastVisitedPage: prefs.getString(_lastPageKey) ?? AppRoutes.login,
          isFirstLaunch: prefs.getBool(_firstLaunchKey) ?? true,
          userEmail: prefs.getString(_userEmailKey) ?? '',
          locale: locale,
          createPasswordTask: prefs.getString(_createPasswordTask) ?? '',
        ),
      );
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to load preferences: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  Future<void> changeLanguage(Locale newLocale) async {
    try {
      await prefs.setString(_localeKey, newLocale.languageCode);

      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        emit(
          currentState.copyWith(
            language: newLocale.languageCode,
            locale: newLocale,
          ),
        );
      }
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to change language: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  Locale getSavedLocale() {
    final langCode = prefs.getString(_localeKey) ?? 'en';
    return Locale(langCode);
  }

  Future<void> setTheme(String theme) async {
    try {
      await prefs.setString(_themeKey, theme);

      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        emit(currentState.copyWith(theme: theme));
      }
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to set theme: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  Future<void> setFirstLaunch(bool isFirstLaunch) async {
    try {
      await prefs.setBool(_firstLaunchKey, isFirstLaunch);

      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        emit(currentState.copyWith(isFirstLaunch: isFirstLaunch));
      }
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to set first launch: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  Future<void> setCreatePasswordTask(String createPasswordTask) async {
    try {
      await prefs.setString(_createPasswordTask, createPasswordTask);

      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        emit(currentState.copyWith(createPasswordTask: createPasswordTask));
      }
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to set create Password Task: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  String getCreatePasswordTask() {
    return prefs.getString(_createPasswordTask) ?? '';
  }

  Future<void> setLastVisitedPage(String currentPage) async {
    try {
      await prefs.setString(_lastPageKey, currentPage);

      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        emit(currentState.copyWith(lastVisitedPage: currentPage));
      }
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to set current page: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  String getLastVisitedPage() {
    return prefs.getString(_lastPageKey) ?? AppRoutes.login;
  }

  Future<void> clearLastVisitedPage() async {
    await prefs.remove(_lastPageKey);
  }

  Future<void> setUserEmail(String userEmail) async {
    try {
      await prefs.setString(_userEmailKey, userEmail);

      if (state is PreferencesLoaded) {
        final currentState = state as PreferencesLoaded;
        emit(currentState.copyWith(userEmail: userEmail));
      }
    } catch (e) {
      emit(
        PreferencesError(
          'Failed to set user Email: $e',
          locale:
              prefs.getString(_localeKey) != null
                  ? Locale(prefs.getString(_localeKey)!)
                  : PlatformDispatcher.instance.locale,
        ),
      );
    }
  }

  String getUserEmail() {
    return prefs.getString(_userEmailKey) ?? '';
  }
}
