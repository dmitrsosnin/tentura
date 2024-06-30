part of 'settings_cubit.dart';

final class SettingsState extends StateBase {
  const SettingsState({
    this.introEnabled = true,
    this.themeMode = ThemeMode.system,
    super.status = FetchStatus.isLoading,
    super.error,
  });

  final bool introEnabled;
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [
        introEnabled,
        themeMode,
        status,
        error,
      ];

  @override
  SettingsState copyWith({
    bool? introEnabled,
    ThemeMode? themeMode,
    FetchStatus? status,
    Object? error,
  }) =>
      SettingsState(
        introEnabled: introEnabled ?? this.introEnabled,
        themeMode: themeMode ?? this.themeMode,
        status: status ?? this.status,
        error: error ?? this.error,
      );
}
