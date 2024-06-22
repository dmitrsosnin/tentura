part of 'settings_cubit.dart';

final class SettingsState extends StateBase {
  const SettingsState({
    this.themeMode = ThemeMode.system,
    super.status,
    super.error,
  });

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [
        themeMode,
        status,
        error,
      ];

  @override
  SettingsState copyWith({
    ThemeMode? themeMode,
    FetchStatus? status,
    Object? error,
  }) =>
      SettingsState(
        themeMode: themeMode ?? this.themeMode,
        status: status ?? this.status,
        error: error ?? this.error,
      );
}
