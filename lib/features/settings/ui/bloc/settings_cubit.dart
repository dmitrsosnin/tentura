import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:tentura/ui/bloc/state_base.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState>
    with HydratedMixin<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    hydrate();
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => json.isEmpty
      ? null
      : SettingsState(
          themeMode: switch (json['themeMode']) {
            'dark' => ThemeMode.dark,
            'light' => ThemeMode.light,
            _ => ThemeMode.system,
          },
        );

  @override
  Map<String, dynamic>? toJson(SettingsState state) =>
      state.themeMode == this.state.themeMode
          ? null
          : {
              'themeMode': switch (state.themeMode) {
                ThemeMode.dark => 'dark',
                ThemeMode.light => 'light',
                ThemeMode.system => 'system',
              }
            };

  void setThemeMode(ThemeMode themeMode) => emit(state.copyWith(
        themeMode: themeMode,
      ));
}
