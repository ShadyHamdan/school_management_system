part of 'preferences_cubit.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();

  Locale get locale => PlatformDispatcher.instance.locale;

  @override
  List<Object> get props => [];
}

class PreferencesInitial extends PreferencesState {}

class PreferencesLoaded extends PreferencesState {
  @override
  final Locale locale;
  final String theme;
  final String language;
  final String lastVisitedPage;
  final bool isFirstLaunch;
  final String userEmail;
  final String createPasswordTask;

  const PreferencesLoaded({
    required this.theme,
    required this.language,
    required this.lastVisitedPage,
    required this.isFirstLaunch,
    required this.userEmail,
    required this.locale,
    required this.createPasswordTask,

  });
  PreferencesLoaded copyWith({
    String? theme,
    String? language,
    String? lastVisitedPage,
    bool? isFirstLaunch,
    String? userEmail,
    Locale? locale,
    String? createPasswordTask,
  }) {
    return PreferencesLoaded(
      lastVisitedPage: lastVisitedPage ?? this.lastVisitedPage,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      userEmail: userEmail ?? this.userEmail,
      locale: locale ?? this.locale,
      createPasswordTask: createPasswordTask ?? this.createPasswordTask,

    );
  }

  @override
  List<Object> get props => [
    theme,
    language,
    isFirstLaunch,
    lastVisitedPage,
    userEmail,
    locale,
    createPasswordTask
  ];
}

class PreferencesError extends PreferencesState {
  final String message;
  @override
  final Locale locale;

  const PreferencesError(this.message, {this.locale = const Locale('en')});

  @override
  List<Object> get props => [message, locale];
}
